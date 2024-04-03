import 'package:flutter/material.dart';
import 'package:pocmytv/models/movie/genre.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/video_on_demand/genre_tile.dart';
import 'package:pocmytv/widgets/drawer_row.dart';

class GenreChooseScreen extends StatefulWidget {
  const GenreChooseScreen({super.key});

  @override
  State<GenreChooseScreen> createState() => _GenreChooseScreenState();
}

class _GenreChooseScreenState extends State<GenreChooseScreen> {
  @override
  Widget build(BuildContext context) {
    var genres = Genre.values.map((e) => e).toList();
    genres.removeWhere((element) =>
        [Genre.western, Genre.war, Genre.tvMovie].contains(element));
    return BubbleAnimation(
      backgroundColor: const Color(0xff008bd6),
      colors: const [
        Colors.white,
        Color(0xFF2B6FC0),
        Color(0xFF2B6FC0),
        Color(0xFF131C49),
      ],
      bubbles: 10,
      maxRadius: 200,
      minRadius: 100,
      child: DrawerRow(
        focusedItem: 3,
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
    );
  }
}
