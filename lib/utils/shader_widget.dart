import 'package:flutter/material.dart';

class ShaderWidget extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  const ShaderWidget(
      {super.key,
      required this.child,
      this.colors = const [
        Colors.deepPurpleAccent,
        Colors.blue,
      ]});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (rect) {
        return LinearGradient(colors: colors).createShader(rect);
      },
      child: child,
    );
  }
}
