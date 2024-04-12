import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pocmytv/pre_loader/pre_loader.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/screens/home/home_bottom_tiles.dart';
import 'package:pocmytv/screens/home/home_page.dart';
import 'package:video_player/video_player.dart';

class MainPage extends StatefulWidget {
  static Widget backgroundVideo = Container(color: Colors.blue);
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
      PreLoader.load(context);
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
              setState(() {
                MainPage.backgroundVideo = AspectRatio(
                  aspectRatio: width / height,
                  child: VideoPlayer(_controller),
                );
              });
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
      body: BackgroundVideo(
        showBackButton: false,
        backgroundWidget: MainPage.backgroundVideo,
        child: const Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: HomePage(),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: HomeBottomTiles(),
    );
  }
}
