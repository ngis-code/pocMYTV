import 'package:flutter/material.dart';
import 'package:pocmytv/models/movie.dart';
import 'package:pocmytv/screens/vod.dart';

class ParallaxEffectScreen extends StatefulWidget {
  const ParallaxEffectScreen({super.key});

  @override
  State<ParallaxEffectScreen> createState() => _ParallaxEffectScreenState();
}

class _ParallaxEffectScreenState extends State<ParallaxEffectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height:( MediaQuery.of(context).size.height *2 ) / 3,
            child: const VideoScreen(), 
          ),
          SizedBox(
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
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Movie.allMovies[index].image),
                    fit: BoxFit.cover,
                  ),),
                  alignment: Alignment.center,
                  );
              },
              itemCount: Movie.allMovies.length,
            ),
          )
        ],
      ),
    );
  }
}