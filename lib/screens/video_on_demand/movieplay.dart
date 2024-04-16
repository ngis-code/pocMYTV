import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:pocmytv/widgets/clock.dart';
import 'package:video_player/video_player.dart';

class MoviePlay extends StatefulWidget {
  final String adVideoUrl;
  final String mainVideoUrl;
  const MoviePlay(
      {super.key, required this.adVideoUrl, required this.mainVideoUrl});

  @override
  State<MoviePlay> createState() => _MoviePlayState();
}

class _MoviePlayState extends State<MoviePlay> {
  late VideoPlayerController _controller;
  late List<String> _videoQueue;
  int _currentVideoIndex = 0;
  bool _isAdVideoPlaying = true;

  @override
  void initState() {
    super.initState();
    _videoQueue = [widget.adVideoUrl, widget.mainVideoUrl];
    _initializeVideoPlayer(_videoQueue[_currentVideoIndex]);
  }

  Future<void> _initializeVideoPlayer(String videoUrl) async {
    _controller = VideoPlayerController.network(
      videoUrl,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    _controller.addListener(_checkVideo);
  }

  void _checkVideo() {
    if (_controller.value.position >= _controller.value.duration) {
      _skipAd();
    }
  }

  Future<void> _loadNextVideo(String videoUrl) async {
    _controller.removeListener(_checkVideo);
    _controller.dispose();
    _initializeVideoPlayer(videoUrl);
    if (_currentVideoIndex > 0) {
      _isAdVideoPlaying =
          false; // Ensure we mark that the ad video is finished if manually skipping
    }
  }

  void _skipAd() {
    if (_isAdVideoPlaying && _videoQueue.length > 1) {
      _isAdVideoPlaying = false; // Ad video is no longer playing
      _loadNextVideo(_videoQueue[1]); // Load the main video
      _currentVideoIndex = 1; // Update the index to reflect the main video
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_checkVideo);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: FocusWidget(
                onTap: () {},
                enabled: false,
                child: VideoPlayer(_controller),
              ),
            )
          : Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
      floatingActionButton: !_isAdVideoPlaying
          ? null
          : FocusWidget(
              onTap: _skipAd,
              borderColor: Colors.white,
              backgroundColor: Colors.black45,
              padding: const EdgeInsets.all(8),
              child: ClockWidget(
                updatePerSec: true,
                builder: (context, time) {
                  final timeToFinish =
                      const Duration(seconds: 5) - _controller.value.position;
                  if (_controller.value.position >=
                      const Duration(seconds: 5)) {
                    return const Icon(
                      Icons.skip_next_rounded,
                      color: Colors.white,
                    );
                  }
                  return GlassWidget(
                    radius: 50,
                    backgroundColor: Colors.black45,
                    blur: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      "${timeToFinish.inMinutes}:${timeToFinish.inSeconds % 60}",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
