import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pocmytv/screens/home/home_bottom_tile.dart';
import 'package:pocmytv/screens/time_line/cruise_schedule_screen.dart';
import 'package:pocmytv/screens/video_on_demand/genre_choose_screen.dart';
import 'package:pocmytv/widgets/drawer.dart';

class BottomMenuTiles extends StatelessWidget {
  BottomMenuTiles({super.key});

  int count = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TVDrawer.drawerHidden,
      builder: (context, value, child) => Row(
        children: [
          HomeBottomTile(
            onFocusChange: onFocusChange,
            description: "Watch your favorite show",
            title: "VOD",
            icon: Icons.tv_rounded,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GenreChooseScreen(),
                ),
              );
            },
          ),
          HomeBottomTile(
            onFocusChange: onFocusChange,
            description: "Cruise Schedule",
            title: "Schedule",
            icon: Icons.timeline,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CruisSchedule(),
                ),
              );
            },
          ),
          HomeBottomTile(
            onFocusChange: onFocusChange,
            description: "Know about the hotel",
            title: "Hotel Info",
            icon: Icons.hotel_rounded,
            onTap: () {
              log("TV");
            },
          ),
          HomeBottomTile(
            onFocusChange: onFocusChange,
            description: "Check the weather",
            title: "Weather",
            icon: Icons.cloud_rounded,
            onTap: () {
              log("TV");
            },
          ),
          HomeBottomTile(
            onFocusChange: onFocusChange,
            description: "Browse your favorite place",
            title: "Restaurant & Bars",
            icon: Icons.restaurant_rounded,
            onTap: () {
              log("TV");
            },
          ),
          HomeBottomTile(
            onFocusChange: onFocusChange,
            description: "Don't Miss Any News",
            title: "News",
            icon: Icons.newspaper_rounded,
            onTap: () {
              log("TV");
            },
          ),
        ],
      ).animate(target: TVDrawer.drawerHidden.value ? 1 : 0).moveY(
            curve: Curves.easeInOut,
            begin: 0,
            end: height - 20,
            duration: const Duration(milliseconds: 500),
          ),
    );
  }

  void onFocusChange(bool hasFocus, double height) {
    this.height = height;
    if (hasFocus) {
      showDrawer();
    } else {
      hideDrawer();
    }
  }

  void hideDrawer() async {
    int tmp = ++count;
    await Future.delayed(const Duration(milliseconds: 1));
    if (count == tmp) {
      TVDrawer.drawerHidden.value = true;
    }
  }

  void showDrawer() async {
    count++;
    TVDrawer.drawerHidden.value = false;
  }
}
