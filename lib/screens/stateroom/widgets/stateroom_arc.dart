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
    // animationController.repeat(reverse: false);
    animationController.animateTo(3.14);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: ProgressArc(animation.value, [], false, Colors.grey),
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter:
                  ProgressArc(widget.value, widget.colors, true, Colors.grey),
            ),
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
    final m = math.min(size.width, size.height);
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: m,
      height: m,
    );
    const startAngle = -math.pi;
    final sweepAngle = value;
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
