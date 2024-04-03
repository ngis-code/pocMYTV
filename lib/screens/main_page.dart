import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/widgets/drawer.dart';

class MainPage extends StatelessWidget {
  static final List<Widget> backgrounds = [
    Container(
      color: Colors.red,
    ),
    BubbleAnimation(
      colors: const [
        Colors.white,
      ],
      bubbles: 10,
      minRadius: 10,
      maxRadius: 20,
      velocityMultiplier: 4,
      child: Container(),
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.purple,
    ),
  ];
  MainPage({super.key});
  final controller = PageController();
  final controller2 = PageController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                controller: controller2,
                itemBuilder: (context, index) {
                  if (index >= backgrounds.length) {
                    log("WARNING: Backgrounds list is too short, repeating backgrounds.");
                  }
                  return backgrounds[index % backgrounds.length];
                },
              ),
            ),
            Positioned(
              left: TVDrawer.width,
              right: 0,
              top: 0,
              bottom: 0,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  return TVDrawer.drawerItems.entries.elementAt(index).value;
                },
              ),
            ),
            Positioned(
              right: width - TVDrawer.width,
              left: 0,
              top: 0,
              bottom: 0,
              child: TVDrawer(
                onPageChange: (index) {
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                  controller2.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
