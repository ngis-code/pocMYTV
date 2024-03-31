import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:vector_math/vector_math.dart' as v;

class BubbleAnimation extends StatefulWidget {
  // all bright and nice colors
  final List<Color> colors;
  final Widget child;
  final int bubbles;
  final int fps;
  final double minRadius;
  final double maxRadius;
  final double velocityMultiplier;
  const BubbleAnimation({
    super.key,
    required this.child,
    this.colors = const [
      Color(0xFFFEBD11),
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
    this.fps = 60,
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;
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
    });
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ..._particles.map(
            (p) => Positioned(
              left: p.x,
              top: p.y,
              child: Container(
                height: _radius[_particles.indexOf(p)],
                width: _radius[_particles.indexOf(p)],
                decoration: BoxDecoration(
                  color: _colors[_particles.indexOf(p) % widget.colors.length],
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: GlassWidget(
              blur: 50,
              child: Container(
                // color: Colors.white54,
                alignment: Alignment.center,
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
    // update positions of particles
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const double margin = 200; // this is the margin beyond the screen's edge
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
    setState(() {});
    _update();
  }
}
