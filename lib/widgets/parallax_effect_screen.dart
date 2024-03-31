import 'package:flutter/material.dart';
import 'package:pocmytv/models/movie.dart';
import 'package:pocmytv/screens/movie_tile.dart';
import 'package:pocmytv/screens/vod.dart';

class ParallaxEffectScreen extends StatefulWidget {
  const ParallaxEffectScreen({super.key});

  @override
  State<ParallaxEffectScreen> createState() => _ParallaxEffectScreenState();
}

class _ParallaxEffectScreenState extends State<ParallaxEffectScreen> {
  static const double maxHeight = 240;
  static const double maxPadding = 20;
  double padding = maxPadding;
  double height = maxHeight - 2 * maxPadding;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 2) / 3,
            child: const VideoScreen(),
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
                      for (int index = 0;
                          index < Movie.allMovies.length;
                          index++)
                        MovieTile(
                          movie: Movie.allMovies[index],
                          height: MediaQuery.of(context).size.height / 3 - 10,
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
