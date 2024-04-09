import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
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
  bool _isAdVideoPlaying = true; // Track if the ad video is currently playing

  @override
  void initState() {
    super.initState();
    _videoQueue = [widget.adVideoUrl, widget.mainVideoUrl];
    _initializeVideoPlayer(_videoQueue[_currentVideoIndex]);
  }

  Future<void> _initializeVideoPlayer(String videoUrl) async {
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    _controller.addListener(_checkVideo);
  }

  void _checkVideo() {
    if (_controller.value.position >= _controller.value.duration) {
      // When one video ends, load and play the next one
      _currentVideoIndex++;
      if (_currentVideoIndex < _videoQueue.length) {
        _loadNextVideo(_videoQueue[_currentVideoIndex]);
      }
      _isAdVideoPlaying = false; // Ad video is no longer playing
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
              child: VideoPlayer(_controller),
            )
          : Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: FocusWidget(
            onTap: () => _skipAd(),
            borderColor: Colors.white,
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.skip_next_rounded)),
      ),
    );
  }
}
