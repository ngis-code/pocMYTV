import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideo extends StatefulWidget {
  final Widget child;
  final bool showBackButton;
  final Widget? backgroundWidget;
  const BackgroundVideo({
    super.key,
    required this.child,
    this.showBackButton = true,
    this.backgroundWidget,
  });

  @override
  State<BackgroundVideo> createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      kIsWeb
          ? 'https://mytvpocroyal.com/uploads/bgMovie.mp4'
          : 'https://mytvpocroyal.com/uploads/bg.avi',
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true,
        allowBackgroundPlayback: true,
      ),
    );
    _controller
        .initialize()
        .then((_) => setState(() {
              _controller
                ..addListener(() => setState(() {}))
                ..setLooping(true)
                ..setVolume(0)
                ..play();
              setState(() {});
            }))
        .onError((error, stackTrace) => log("Error Loading Video: $error"));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          if (widget.backgroundWidget == null)
            Positioned.fill(
              child: Container(
                color: Colors.blue,
              ),
            ),
          Positioned.fill(
              child: widget.backgroundWidget ??
                  ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    child: FocusWidget(
                      borderColor: Colors.transparent,
                      borderRadius: 0,
                      blur: 0,
                      borderWidth: 0,
                      enabled: false,
                      onTap: () {},
                      child: AspectRatio(
                        aspectRatio: width / height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )),
          Positioned.fill(child: widget.child),
          if (widget.showBackButton && Navigator.of(context).canPop())
            Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(color: Colors.white, Icons.arrow_back),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
        ],
      ),
    );
  }
}
