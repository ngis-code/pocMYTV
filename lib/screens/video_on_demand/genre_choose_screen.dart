import 'package:flutter/material.dart';
import 'package:pocmytv/models/movie/genre.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/screens/video_on_demand/genre_tile.dart';

class GenreChooseScreen extends StatefulWidget {
  const GenreChooseScreen({super.key});

  @override
  State<GenreChooseScreen> createState() => _GenreChooseScreenState();
}

class _GenreChooseScreenState extends State<GenreChooseScreen> {
  @override
  Widget build(BuildContext context) {
    var genres = Genre.values.map((e) => e).toList();
    // genres.removeWhere((element) => [
    //       Genre.western,
    //       Genre.war,
    //       Genre.tvMovie,
    //       Genre.romance,
    //       Genre.thriller,
    //       Genre.scienceFiction,
    //     ].contains(element));
    return Scaffold(
      body: BackgroundVideo(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    ...genres.map(
                      (e) => GenreTile(
                        genre: e,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
