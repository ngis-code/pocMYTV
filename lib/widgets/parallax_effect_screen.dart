import 'package:flutter/material.dart';
import 'package:pocmytv/models/movie.dart';
import 'package:pocmytv/screens/vod.dart';
import 'package:pocmytv/widgets/focus_widget.dart';

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
              height: MediaQuery.of(context).size.height / 3,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: FocusWidget(
                      child: Image.asset(
                        Movie.allMovies[index].image,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {},
                    ),
                  );
                },
                itemCount: Movie.allMovies.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
