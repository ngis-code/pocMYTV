import 'package:flutter/material.dart';

class ShaderWidget extends StatelessWidget {
  final Widget child;
  final List<Color> colors = const [
    Colors.deepPurpleAccent,
    Colors.blue,
  ];
  const ShaderWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (rect) {
        return const LinearGradient(colors: colors).createShader(rect);
      },
      child: child,
    );
  }
}
