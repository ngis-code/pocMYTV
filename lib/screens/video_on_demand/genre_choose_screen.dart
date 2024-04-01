import 'package:flutter/material.dart';
import 'package:pocmytv/models/genre.dart';
import 'package:pocmytv/screens/video_on_demand/genre_tile.dart';

class GenreChooseScreen extends StatefulWidget {
  const GenreChooseScreen({super.key});

  @override
  State<GenreChooseScreen> createState() => _GenreChooseScreenState();
}

class _GenreChooseScreenState extends State<GenreChooseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
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
    );
  }
}