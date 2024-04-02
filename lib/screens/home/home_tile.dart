import 'package:flutter/material.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class HomeTile extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const HomeTile(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.all(20)});

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      blur: 20,
      radius: 20,
      child: Container(color: Colors.black45, padding: padding, child: child),
    );
  }
}
