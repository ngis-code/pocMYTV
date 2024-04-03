import 'package:flutter/material.dart';

PageRouteBuilder animatedPageRoute({
  required Widget child,
  Offset begin = const Offset(0.0, 1.0),
  Offset end = Offset.zero,
  Curve curve = Curves.ease,
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
