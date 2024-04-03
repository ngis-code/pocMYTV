import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SafetyVideoScreen extends StatefulWidget {
  final Function onVideoCompleted;
  const SafetyVideoScreen({super.key, required this.onVideoCompleted});

  @override
  State<SafetyVideoScreen> createState() => _SafetyVideoScreenState();
}

class _SafetyVideoScreenState extends State<SafetyVideoScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://deeplink.recruitpick.com/uploads/LifeJacket_EN_072021.mp4',
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false))
      ..initialize().then((_) {
        setState(() {});
      })
      ..play()
      ..setLooping(false)
      ..addListener(checkVideo);
  }

  void checkVideo() {
    if (_controller.value.isInitialized &&
        _controller.value.position == _controller.value.duration) {
      widget.onVideoCompleted();
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(checkVideo); // Remove the listener
    _controller.dispose();
    super.dispose();
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
