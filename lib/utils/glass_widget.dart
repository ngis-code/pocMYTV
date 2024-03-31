import 'dart:ui';

import 'package:flutter/material.dart';

/// Glass Widget
class GlassWidget extends StatelessWidget {
  final double radius;
  final Widget child;
  final double blur;
  const GlassWidget(
      {super.key, this.radius = 0, required this.child, this.blur = 15});

  @override
  Widget build(BuildContext context) {
    if (blur == 0) return child;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child,
      ),
    );
  }
}
