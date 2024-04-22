import 'package:flutter/material.dart';
import 'package:pocmytv/screens/video_on_demand/common_video_player.dart';
import 'package:pocmytv/widgets/common_back_button.dart';

class MoviePlayyy extends StatelessWidget {
  final String movieUrl;
  const MoviePlayyy({super.key, required this.movieUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CommonVideoPlayer(
          videoUrl: movieUrl,
          header: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonBackButton(),
            ],
          ),
          showControls: true,
          onNext: (_) {},
          onPrev: (_) {},
        ),
      ),
    );
  }
}
