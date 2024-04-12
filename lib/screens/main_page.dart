import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/screens/home/bottom_menu_tiles.dart';
import 'package:pocmytv/screens/home/home_page.dart';
import 'package:video_player/video_player.dart';

class MainPage extends StatefulWidget {
  static Widget backgroundVideo = Container(
    height: 20,
    width: 20,
    color: Colors.blue,
  );
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: const BackgroundVideo(
        child: HomePage(),
      ),
      extendBody: true,
      bottomNavigationBar: BottomMenuTiles(),
    );
  }
}
