import 'package:flutter/material.dart';
import 'package:pocmytv/widgets/drawer.dart';
import 'package:video_player/video_player.dart';

class MainPage extends StatefulWidget {
  static late Widget backgroundVideo;
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageController = PageController();
  final bgPageController = PageController();
  bool initialized = false;
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
      'https://deeplink.recruitpick.com/uploads/bgMovie.mp4',
    );
    controller
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((_) => setState(() {
            initialized = true;
            final width = MediaQuery.of(context).size.width;
            final height = MediaQuery.of(context).size.height;
            MainPage.backgroundVideo = AspectRatio(
              aspectRatio: width / height,
              child: VideoPlayer(controller),
            );
          }))
      ..play();
  }

  @override
  void dispose() {
    pageController.dispose();
    bgPageController.dispose();
    controller.dispose();
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
                  return MainPage.backgroundVideo;
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
      ),
    );
  }
}
