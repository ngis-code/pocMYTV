import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pocmytv/services/keyboard_service.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:vector_math/vector_math.dart' as v;

class BubbleAnimation extends StatefulWidget {
  final List<Color> colors;
  final Widget child;
  final int bubbles;
  final double minRadius;
  final double blur;
  final double maxRadius;
  final double fps;
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
    this.velocityMultiplier = 1,
    this.blur = 50,
    this.backgroundColor = Colors.black,
    this.fps = 15,
  });

  @override
  State<BubbleAnimation> createState() => _BubbleAnimationState();
}

class _BubbleAnimationState extends State<BubbleAnimation> {
  final List<v.Vector2> _particles = [];
  final List<v.Vector2> _velocities = [];
  final List<double> _radius = [];
  final List<Color> _colors = [];
  bool disposed = false;
  int timeDelta = 1000 ~/ 60;
  DateTime lastUpdate = DateTime.now();

  @override
  void initState() {
    super.initState();
    final width =
        MediaQuery.of(KeyBoardService.navigatorKey.currentContext!).size.width;
    final height =
        MediaQuery.of(KeyBoardService.navigatorKey.currentContext!).size.height;
    for (var i = 0; i < widget.bubbles; i++) {
      _particles.add(v.Vector2(
        math.Random().nextDouble() * width,
        math.Random().nextDouble() * height,
      ));
      _velocities.add(v.Vector2(
        (math.Random().nextDouble() - 0.5) * widget.velocityMultiplier,
        (math.Random().nextDouble() - 0.5) * widget.velocityMultiplier,
      ));
      _radius.add(
          math.Random().nextDouble() * (widget.maxRadius - widget.minRadius) +
              widget.minRadius);
      _colors.add(widget.colors[i % widget.colors.length]);
    }
    _update();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // calculating fpsx`
    final now = DateTime.now();
    timeDelta = now.difference(lastUpdate).inMilliseconds;
    lastUpdate = now;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final double margin = widget.maxRadius + 50;
    // this is the margin beyond the screen's edge
    for (var i = 0; i < _particles.length; i++) {
      _particles[i] += _velocities[i];
      if (_particles[i].x < -margin) {
        _particles[i].x = width + margin;
      } else if (_particles[i].x > width + margin) {
        _particles[i].x = -margin;
      }
      if (_particles[i].y < -margin) {
        _particles[i].y = height + margin;
      } else if (_particles[i].y > height + margin) {
        _particles[i].y = -margin;
      }
    }

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Stack(
        children: [
          for (int i = 0; i < _particles.length; i++)
            Positioned(
              left: _particles[i].x,
              top: _particles[i].y,
              child: Container(
                height: _radius[i],
                width: _radius[i],
                decoration: BoxDecoration(
                  color: _colors[i % _colors.length],
                  shape: BoxShape.circle,
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

  Future<void> _update() async {
    await Future.delayed(Duration(milliseconds: 1000 ~/ widget.fps));
    if (disposed) return;
    if (!context.mounted) return;
    setState(() {});
    _update();
  }
}
