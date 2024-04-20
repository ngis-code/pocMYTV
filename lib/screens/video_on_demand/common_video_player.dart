import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:video_player/video_player.dart';

class CommonVideoPlayer extends StatefulWidget {
  final String? videoUrl;
  final bool asset;
  final VideoPlayerController? controller;
  final bool showControls;
  final Widget? loadingWidget;
  final bool matchFullScreen;
  final void Function(VideoPlayerController controller)? onNext;
  final void Function(VideoPlayerController controller)? onPrev;
  final void Function(VideoPlayerController controller)? onPlayPause;
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
    this.onNext,
    this.onPrev,
    this.onPlayPause,
  });

  @override
  State<CommonVideoPlayer> createState() => _CommonVideoPlayerState();
}

class _CommonVideoPlayerState extends State<CommonVideoPlayer> {
  late final VideoPlayerController _controller;
  bool disposed = false;

  int count = 0;
  bool show = true;

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
        if (disposed) return;
        if (widget.onComplete != null) {
          _controller.addListener(() {
            if (disposed) return;
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
    disposed = true;
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget videoPlayer = FocusWidget(
      onTap: () {
        showControls();
      },
      enabled: false,
      child: VideoPlayer(_controller),
    );
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
        if (widget.showControls)
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.onPrev != null)
                  FocusWidget(
                    onFocusChange: onFocusChange,
                    focusGroup: 'video_controls',
                    backgroundColor: Colors.black.withOpacity(0.5),
                    borderRadius: 20,
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.skip_previous_rounded,
                      color: Colors.white,
                    ),
                    onTap: () {
                      if (_controller.value.position > Duration.zero) {
                        _controller.seekTo(Duration.zero);
                      } else {
                        widget.onPrev?.call(_controller);
                      }
                    },
                  ),
                FocusWidget(
                  onFocusChange: onFocusChange,
                  focusGroup: 'video_controls',
                  hasFocus: true,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  borderRadius: 20,
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    color: Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                    widget.onPlayPause?.call(_controller);
                  },
                ),
                if (widget.onNext != null)
                  FocusWidget(
                    onFocusChange: onFocusChange,
                    focusGroup: 'video_controls',
                    backgroundColor: Colors.black.withOpacity(0.5),
                    borderRadius: 20,
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.skip_next_rounded,
                      color: Colors.white,
                    ),
                    onTap: () {
                      _controller.seekTo(_controller.value.duration);
                      widget.onNext?.call(_controller);
                    },
                  ),
              ],
            ),
          )
              .animate(
                target: show ? 1 : 0,
              )
              .fade(
                curve: Curves.easeInOut,
                begin: 0,
                end: 1,
                duration: const Duration(milliseconds: 500),
              ),
      ],
    );
  }

  void onFocusChange(bool hasFocus) {
    showControls();
  }

  void showControls() async {
    int tmp = ++count;
    setState(() {
      show = true;
    });
    await Future.delayed(const Duration(seconds: 5));
    if (count == tmp) {
      setState(() {
        show = false;
      });
    }
  }
}
