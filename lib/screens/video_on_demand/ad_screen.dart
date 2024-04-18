import 'package:flutter/material.dart';
import 'package:pocmytv/screens/video_on_demand/common_video_player.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:video_player/video_player.dart';

import '../../focus_system/focus_widget.dart';
import '../../widgets/clock.dart';

class AdvertisementScreen extends StatefulWidget {
  final String adUrl;
  const AdvertisementScreen({super.key, required this.adUrl});

  @override
  State<AdvertisementScreen> createState() => _AdvertisementScreenState();
}

class _AdvertisementScreenState extends State<AdvertisementScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.adUrl,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      })
      ..addListener(() {
        if (_controller.value.position >= _controller.value.duration) {
          skipAd();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void skipAd() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonVideoPlayer(
        controller: _controller,
        matchFullScreen: true,
      ),
      floatingActionButton: GlassWidget(
        radius: 20,
        backgroundColor: Colors.black45,
        padding: const EdgeInsets.all(8),
        child: ClockWidget(
          updatePerSec: true,
          builder: (context, time) {
            final timeToFinish =
                _controller.value.duration - _controller.value.position;
            return Text(
              "Your movie will start after this ad ${timeToFinish.inSeconds % 60}",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            );
          },
        ),
      ),
    );
  }
}
