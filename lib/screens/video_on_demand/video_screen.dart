import 'package:flutter/material.dart';
import 'package:pocmytv/models/movie/movie.dart';
import 'package:pocmytv/screens/video_on_demand/movie_tile.dart';
import 'package:pocmytv/screens/video_on_demand/parallex_videos.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  static const double maxHeight = 240;
  static const double maxPadding = 20;
  double padding = maxPadding;
  double height = maxHeight - 2 * maxPadding;
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 2) / 3,
            child: const ParallexVideos(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3 - 10,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int index = 0; index < Movie.allMovies.length; index++)
                      MovieTile(
                        movie: Movie.allMovies[index],
                        height: MediaQuery.of(context).size.height / 3 - 10,
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
