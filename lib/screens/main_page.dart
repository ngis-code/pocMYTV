import 'package:flutter/material.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/screens/home/home_bottom_tiles.dart';
import 'package:pocmytv/screens/home/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: BackgroundVideo(
        showBackButton: false,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: HomePage(),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: HomeBottomTiles(),
    );
  }
}
