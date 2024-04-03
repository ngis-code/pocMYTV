import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/widgets/drawer.dart';

class MainPage extends StatefulWidget {
  static late final List<Widget> backgrounds;
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageController = PageController();
  final bgPageController = PageController();

  @override
  void initState() {
    super.initState();
    MainPage.backgrounds = [
      // HOME PAGE
      Container(),
      // SAFETY INFORMATION
      BubbleAnimation(
        colors: const [
          Colors.red,
          Colors.blue,
          Colors.green,
          Colors.yellow,
          Colors.purple,
        ],
        child: Container(),
      ),
      // LIVE TV
      Container(),
      // VOD
      BubbleAnimation(
        backgroundColor: const Color(0xff008bd6),
        colors: const [
          Colors.white,
          Color(0xFF2B6FC0),
          Color(0xFF2B6FC0),
          Color(0xFF131C49),
        ],
        bubbles: 10,
        maxRadius: 200,
        minRadius: 100,
        child: Container(),
      ),
      // Ship INFO
      Image.network(
        'https://wallpapers-all.com/uploads/posts/2016-11/4_thailand.jpg',
        fit: BoxFit.cover,
      ),
      // Account
      BubbleAnimation(
        colors: const [
          Colors.red,
          Colors.blue,
          Colors.green,
          Colors.yellow,
          Colors.purple,
        ],
        child: Container(),
      ),
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    bgPageController.dispose();
    super.dispose();
  }

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
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                allowImplicitScrolling: false,
                controller: bgPageController,
                itemBuilder: (context, index) {
                  if (index >= MainPage.backgrounds.length) {
                    log("WARNING: Backgrounds list is too short, repeating backgrounds.");
                  }
                  return MainPage
                      .backgrounds[index % MainPage.backgrounds.length];
                },
              ),
            ),
            Positioned(
              left: TVDrawer.width,
              right: 0,
              top: 0,
              bottom: 0,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                allowImplicitScrolling: false,
                controller: pageController,
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
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                  bgPageController.animateToPage(
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
