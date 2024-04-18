import 'package:flutter/material.dart';
import 'package:pocmytv/screens/video_on_demand/common_video_player.dart';

class MoviePlayyy extends StatelessWidget {
  final String movieUrl;
  const MoviePlayyy({super.key, required this.movieUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CommonVideoPlayer(videoUrl: movieUrl)),
    );
  }
}
