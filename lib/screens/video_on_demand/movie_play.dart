import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MoviePlayyy extends StatefulWidget {
  final String movieUrl;
  final Function? onMovieEnd;
  const MoviePlayyy({super.key, required this.movieUrl, this.onMovieEnd});

  @override
  State<MoviePlayyy> createState() => _MoviePlayyyState();
}

class _MoviePlayyyState extends State<MoviePlayyy> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.movieUrl,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      })
      ..addListener(() {
        if (_controller.value.position >= _controller.value.duration) {
          widget.onMovieEnd?.call();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
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
    );
  }
}
