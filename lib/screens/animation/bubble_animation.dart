import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pocmytv/services/keyboard_service.dart';
import 'package:pocmytv/utils/glass_widget.dart';

import '../../globals.dart';

extension OffsetMath on Offset {
  Offset operator +(Offset other) => Offset(dx + other.dx, dy + other.dy);
  double get x => dx;
  double get y => dy;
}

class BubbleAnimation extends StatefulWidget {
  final List<Color> colors;
  final Widget child;
  final int bubbles;
  final double minRadius;
  final double blur;
  final double maxRadius;
  final double velocityMultiplier;
  final Color backgroundColor;

  const BubbleAnimation({
    super.key,
    required this.child,
    this.colors = const [
      Color.fromARGB(255, 232, 116, 53),
      Color(0xFF061556),
      Color(0xFF0073BB),
      Colors.blue,
      Colors.blueAccent,
      Color(0xFF2B6FC0),
      Color(0xFF131C49),
    ],
    this.bubbles = 80,
    this.minRadius = 20,
    this.maxRadius = 150,
    this.velocityMultiplier = 0.5,
    this.blur = 50,
    this.backgroundColor = Colors.black,
  });

  @override
  State<BubbleAnimation> createState() => _BubbleAnimationState();
}

class _BubbleAnimationState extends State<BubbleAnimation>
    with TickerProviderStateMixin {
  final List<Offset> _particles = [];
  final List<Offset> _velocities = [];
  final List<double> _radius = [];
  final List<Color> _colors = [];

  late final Ticker ticker;

  @override
  void initState() {
    super.initState();
    if (KeyBoardService.navigatorKey.currentContext == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _init());
    } else {
      /// TODO: removed for now
      // _init();
    }
  }

  @override
  void dispose() {
    ticker.stop();
    ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _BubblePainter(
                particles: _particles,
                velocities: _velocities,
                radius: _radius,
                colors: _colors,
              ),
            ),
          ),
          Positioned.fill(
            child: GlassWidget(
              blur: widget.blur,
              child: Center(
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _update(Duration elapsedTime) async {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    /// this is the margin beyond the screen's edge
    final double margin = widget.maxRadius + 50;

    for (var i = 0; i < _particles.length; i++) {
      _particles[i] += _velocities[i];
      if (_particles[i].x < -margin) {
        _particles[i] = Offset(width + margin, _particles[i].y);
      } else if (_particles[i].x > width + margin) {
        _particles[i] = Offset(-margin, _particles[i].y);
      }
      if (_particles[i].y < -margin) {
        _particles[i] = Offset(_particles[i].x, height + margin);
      } else if (_particles[i].y > height + margin) {
        _particles[i] = Offset(_particles[i].x, -margin);
      }
    }

    setState(() {});
  }

  void _init() {
    final width = MediaQuery.of(appContext).size.width;
    final height = MediaQuery.of(appContext).size.height;
    for (var i = 0; i < widget.bubbles; i++) {
      _particles.add(Offset(
        math.Random().nextDouble() * width,
        math.Random().nextDouble() * height,
      ));
      _velocities.add(Offset(
        (math.Random().nextDouble() - 0.5) * widget.velocityMultiplier,
        (math.Random().nextDouble() - 0.5) * widget.velocityMultiplier,
      ));
      _radius.add(
          math.Random().nextDouble() * (widget.maxRadius - widget.minRadius) +
              widget.minRadius);
      _colors.add(widget.colors[i % widget.colors.length]);
    }
    ticker = createTicker(_update);
    ticker.start();
  }
}

class _BubblePainter extends CustomPainter {
  final List<Offset> particles;
  final List<Offset> velocities;
  final List<double> radius;
  final List<Color> colors;
  _BubblePainter({
    required this.particles,
    required this.velocities,
    required this.radius,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < particles.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;
      canvas.drawCircle(particles[i], radius[i], paint);
    }
  }

  @override
  bool shouldRepaint(_BubblePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_BubblePainter oldDelegate) => false;
}
