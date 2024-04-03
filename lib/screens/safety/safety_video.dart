import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SafetyVideoScreen extends StatefulWidget {
  const SafetyVideoScreen({super.key});

  @override
  State<SafetyVideoScreen> createState() => _SafetyVideoScreenState();
}

class _SafetyVideoScreenState extends State<SafetyVideoScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://deeplink.recruitpick.com/uploads/LifeJacket_EN_072021.mp4')
      ..initialize().then((_) {
        setState(() {});
      })
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: VideoPlayer(_controller),
    );
  }
}
