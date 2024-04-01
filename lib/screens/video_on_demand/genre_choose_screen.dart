import 'package:flutter/material.dart';
import 'package:pocmytv/models/genre.dart';
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
    return BubbleAnimation(
      colors: const [
        Colors.white,
        Colors.lightBlue,
        Color(0xFF2B6FC0),
        Color(0xFF131C49),
      ],
      bubbles: 30,

      child: DrawerRow(
        focusedItem: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  for (int index = 0; index < Genre.values.length; index++)
                    GenreTile(genre: Genre.values[index]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
