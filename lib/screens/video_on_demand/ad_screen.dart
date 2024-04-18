import 'package:flutter/material.dart';
import 'package:pocmytv/screens/video_on_demand/common_video_player.dart';
import 'package:video_player/video_player.dart';

import '../../focus_system/focus_widget.dart';
import '../../widgets/clock.dart';

class AdvertisementScreen extends StatefulWidget {
  final String adUrl;
  final void Function(VideoPlayerController)? onComplete;
  const AdvertisementScreen({super.key, required this.adUrl, this.onComplete});

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
    widget.onComplete?.call(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CommonVideoPlayer(
        controller: _controller,
        matchFullScreen: true,
      ),
      floatingActionButton: FocusWidget(
        onTap: skipAd,
        borderColor: Colors.white,
        backgroundColor: Colors.black45,
        padding: const EdgeInsets.all(8),
        child: ClockWidget(
          updatePerSec: true,
          builder: (context, time) {
            final timeToFinish =
                const Duration(seconds: 5) - _controller.value.position;
            if (_controller.value.position >= const Duration(seconds: 5)) {
              return const Icon(
                Icons.skip_next_rounded,
                color: Colors.white,
              );
            }
            return Text(
              "Skip ${timeToFinish.inMinutes}:${timeToFinish.inSeconds % 60}",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            );
          },
        ),
      ),
    );
  }
}
