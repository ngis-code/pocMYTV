import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pocmytv/screens/always_alive_page.dart';
import 'package:pocmytv/widgets/drawer.dart';
import 'package:video_player/video_player.dart';

class MainPage extends StatefulWidget {
  static Widget backgroundVideo = const SizedBox(height: 20, width: 20);
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageController = PageController();
  final bgPageController = PageController();
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // PreLoader.load(context);
    });
    _controller = VideoPlayerController.network(
      kIsWeb
          ? 'https://deeplink.recruitpick.com/uploads/bgMovie.mp4'
          : 'https://deeplink.recruitpick.com/uploads/bg.avi',
    );
    _controller
        .initialize()
        .then((_) => setState(() {
              _controller
                ..addListener(() => setState(() {}))
                ..setLooping(true)
                ..setVolume(0)
                ..play();
              final width = MediaQuery.of(context).size.width;
              final height = MediaQuery.of(context).size.height;
              MainPage.backgroundVideo = AspectRatio(
                aspectRatio: width / height,
                child: VideoPlayer(_controller),
              );
            }))
        .onError((error, stackTrace) => log("Error Loading Video: $error"));
  }

  @override
  void dispose() {
    pageController.dispose();
    bgPageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ValueListenableBuilder(
          valueListenable: TVDrawer.drawerHidden,
          builder: (context, value, child) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  // Background
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
                        return MainPage.backgroundVideo;
                      },
                    ),
                  ),
                  // Main Content
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
                        return AlwaysAlivePage(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            child: TVDrawer.drawerItems.entries
                                .elementAt(index)
                                .value,
                          ),
                        );
                      },
                    ),
                  ),
                  // Drawer
                  Positioned(
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
                        // bgPageController.animateToPage(
                        //   index,
                        //   duration: const Duration(milliseconds: 200),
                        //   curve: Curves.easeInOut,
                        // );
                      },
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
