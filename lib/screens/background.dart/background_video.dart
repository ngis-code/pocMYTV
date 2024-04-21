import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:video_player/video_player.dart';

import '../../globals.dart';

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
  bool disposed = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      kIsWeb
          ? 'https://mytvpocroyal.com/uploads/H264HD1080.mp4'
          : 'https://mytvpocroyal.com/uploads/H264HD1080.mp4',
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true,
        allowBackgroundPlayback: true,
      ),
    );
    _controller.initialize().then((_) {
      if (disposed) return;
      setState(() {
        _controller
          ..addListener(() {
            if (disposed) return;
            setState(() {});
          })
          ..setLooping(true)
          ..setVolume(0)
          ..play();
        if (disposed) return;
        setState(() {});
      });
    }).onError((error, stackTrace) {
      log("Error Loading Video: $error");
    });
  }

  @override
  void dispose() {
    disposed = true;
    _controller.dispose();
    super.dispose();
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
                FocusWidget(
                  borderColor: Colors.transparent,
                  borderRadius: 0,
                  blur: 0,
                  borderWidth: 0,
                  enabled: false,
                  onTap: () {},
                  child: AspectRatio(
                    aspectRatio: width / height,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                ),
          ),
          if (widget.backgroundWidget == null)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: darkBlue.withOpacity(0.5),
                  // gradient: LinearGradient(
                  //   end: Alignment.topCenter,
                  //   begin: Alignment.bottomCenter,
                  //   colors: [
                  //     Color.fromARGB(255, 4, 69, 122),
                  //     Colors.transparent,
                  //   ],
                  // ),
                ),
              ),
            ),
          Positioned.fill(child: widget.child),
          if (widget.showBackButton && Navigator.of(context).canPop())
            Positioned(
              top: 10,
              left: 10,
              // child: GestureDetector(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     // child: Icon(color: Colors.white, Icons.arrow_back, size: 30),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         color: Colors.black.withOpacity(0.5),
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       padding: const EdgeInsets.all(8),
              //       child: const Icon(
              //         Icons.arrow_back_rounded,
              //         color: Colors.white,
              //         size: 30,
              //       ),
              //     ),
              //   ),
              //   onTap: () => Navigator.of(context).pop(),
              // ),
              child: FocusWidget(
                enabled: false,
                onTap: () {},
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(15)),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.home_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        'Press Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
