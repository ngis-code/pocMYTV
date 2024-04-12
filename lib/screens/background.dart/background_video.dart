import 'package:flutter/material.dart';
import 'package:pocmytv/screens/main_page.dart';

class BackgroundVideo extends StatelessWidget {
  final Widget child;
  const BackgroundVideo({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(child: MainPage.backgroundVideo),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
