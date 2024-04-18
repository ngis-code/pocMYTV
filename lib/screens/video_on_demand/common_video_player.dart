import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CommonVideoPlayer extends StatefulWidget {
  final String? videoUrl;
  final bool asset;
  final VideoPlayerController? controller;
  final bool showControls;
  final Widget? loadingWidget;
  final bool matchFullScreen;
  final Function(VideoPlayerController controller)? onComplete;
  const CommonVideoPlayer({
    super.key,
    this.videoUrl,
    this.asset = false,
    this.controller,
    this.showControls = false,
    this.loadingWidget,
    this.matchFullScreen = false,
    this.onComplete,
  });

  @override
  State<CommonVideoPlayer> createState() => _CommonVideoPlayerState();
}

class _CommonVideoPlayerState extends State<CommonVideoPlayer> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    assert(widget.videoUrl != null || widget.controller != null,
        "Video URL or controller must be provided");
    _controller = widget.controller ??
        (widget.asset
            ? VideoPlayerController.asset(widget.videoUrl!)
            : VideoPlayerController.network(widget.videoUrl!))
      ..initialize().then((_) {
        if (widget.onComplete != null) {
          _controller.addListener(() {
            if (_controller.value.position >= _controller.value.duration) {
              widget.onComplete!(_controller);
            }
          });
        }
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget videoPlayer = VideoPlayer(_controller);
    if (widget.matchFullScreen) {
      videoPlayer = FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: videoPlayer,
        ),
      );
    }
    return Stack(
      children: [
        if (widget.showControls)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(_controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {
                      _controller.seekTo(_controller.value.duration);
                    },
                  ),
                ],
              ),
            ),
          ),
        if (!_controller.value.isInitialized)
          Center(
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: widget.loadingWidget ??
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
            ),
          ),
        Positioned.fill(
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: videoPlayer,
          ),
        ),
      ],
    );
  }
}
