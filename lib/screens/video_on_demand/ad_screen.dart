import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      body: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: FocusWidget(
            onTap: () {},
            enabled: false,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
      ),
      floatingActionButton: FocusWidget(
        focusGroup: 'ad_skip_bttn',
        hasFocus: true,
        borderColor: Colors.transparent,
        onTap: kDebugMode ? skipAd : () {},
        borderRadius: 20,
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
