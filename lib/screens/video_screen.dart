import 'package:flutter/material.dart';
import 'package:pocmytv/models/genre.dart';
import 'package:pocmytv/screens/bubble_animation.dart';
import 'package:pocmytv/screens/genre_tile.dart';
import 'package:pocmytv/widgets/parallax_effect_screen.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return BubbleAnimation(
      bubbles: 100,
      minRadius: 20,
      blur: 0,
      colors: const [
        Colors.blue,
        Colors.red,
        Colors.green,
        Colors.yellow,
        Colors.purple,
        Colors.orange,
        Colors.pink,
        Colors.teal,
        Colors.cyan,
        Colors.indigo,
      ],
      maxRadius: 100,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              for (int index = 0; index < Genre.values.length; index++)
                GenreTile(
                  genre: Genre.values[index],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
