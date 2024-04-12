import 'package:flutter/material.dart';
import 'package:pocmytv/screens/main_page.dart';

class BackgroundVideo extends StatelessWidget {
  final Widget child;
  final bool showBackButton;
  final Widget? backgroundWidget;
  const BackgroundVideo({
    super.key,
    required this.child,
    this.showBackButton = true,
    this.backgroundWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(child: backgroundWidget ?? MainPage.backgroundVideo),
          Positioned.fill(child: child),
          if (showBackButton)
            Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(color: Colors.white, Icons.arrow_back),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
        ],
      ),
    );
  }
}
