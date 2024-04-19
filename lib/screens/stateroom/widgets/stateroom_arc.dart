import 'dart:math' as math;

import 'package:flutter/material.dart';

class StateRoomArc extends StatefulWidget {
  final List<Color> colors;
  final double value;
  const StateRoomArc({super.key, required this.colors, required this.value});

  @override
  State<StateRoomArc> createState() => _StateRoomArcState();
}

class _StateRoomArcState extends State<StateRoomArc>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    final curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic);
    animation = Tween<double>(
      begin: 0,
      end: 3.14,
    ).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: const Size(300, 300),
            painter: ProgressArc(animation.value, [], false, Colors.grey),
          ),
          CustomPaint(
            size: const Size(300, 300),
            painter:
                ProgressArc(widget.value, widget.colors, true, Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ProgressArc extends CustomPainter {
  bool isBackground;
  final double value;
  Color progressColor;
  final List<Color> colors;
  ProgressArc(this.value, this.colors, this.isBackground, this.progressColor);

  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTRB(0, 0, 300, 300);
    const startAngle = -math.pi;
    final sweepAngle = -value != null ? value : math.pi;
    const userCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    if (isBackground) {
      paint.shader = LinearGradient(
        colors: colors,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect);
    }
    canvas.drawArc(rect, startAngle, sweepAngle, userCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
