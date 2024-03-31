import 'package:flutter/material.dart';
import 'package:pocmytv/models/movie.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Movie.allMovies[index].image),
                fit: BoxFit.cover,
              ),
            ),
            // child: Center(
            //   child: Text('Item $index'),
            // ),
          );
        },
        itemCount: Movie.allMovies.length,
      ),
    );
  }
}
