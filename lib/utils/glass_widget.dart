import 'dart:ui';

import 'package:flutter/material.dart';

/// Glass Widget
class GlassWidget extends StatelessWidget {
  final double radius;
  final Widget child;
  final double blur;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  const GlassWidget({
    super.key,
    this.radius = 0,
    required this.child,
    this.blur = 15,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Widget glassWidget = child;
    if (backgroundColor != null || radius != 0 || padding != null) {
      glassWidget = Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        clipBehavior: Clip.hardEdge,
        child: child,
      );
    }
    if (blur != 0) {
      glassWidget = ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: glassWidget,
        ),
      );
    }
    return glassWidget;
  }
}
