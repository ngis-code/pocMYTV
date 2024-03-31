import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pocmytv/home_bottom_tile.dart';
import 'package:pocmytv/screens/time_line/cruise_schedule_screen.dart';
import 'package:pocmytv/widgets/basic_navigator_widget.dart';

import 'vod.dart';

class BottomMenuTiles extends StatelessWidget {
  ScrollController scrollController = ScrollController();
  BottomMenuTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: Colors.white,
      trackColor: Colors.black,
      trackVisibility: true,
      padding: const EdgeInsets.only(bottom: -20),
      controller: scrollController,
      scrollbarOrientation: ScrollbarOrientation.bottom,
      thickness: 10, //According to your choice
      thumbVisibility: true, //
      child: GridView.count(
        controller: scrollController,
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        scrollDirection: Axis.horizontal,
        children: [
          HomeBottomTile(
            description: "Watch your favorite show",
            title: "VOD",
            icon: Icons.tv_rounded,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VideoScreen(),
                ),
              );
            },
          ),
          HomeBottomTile(
            description: "Cruise Schedule",
            title: "Schedule",
            icon: Icons.timeline,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BasicNavigation(child: CruisSchedule()),
                ),
              );
            },
          ),
          HomeBottomTile(
            description: "Know about the hotel",
            title: "Hotel Info",
            icon: Icons.hotel_rounded,
            onTap: () {
              log("TV");
            },
          ),
          HomeBottomTile(
            description: "Check the weather",
            title: "Weather",
            icon: Icons.cloud_rounded,
            onTap: () {
              log("TV");
            },
          ),
          HomeBottomTile(
            description: "Browse your favorite place",
            title: "Restaurant & Bars",
            icon: Icons.restaurant_rounded,
            onTap: () {
              log("TV");
            },
          ),
          HomeBottomTile(
            description: "Don't Miss Any News",
            title: "News",
            icon: Icons.newspaper_rounded,
            onTap: () {
              log("TV");
            },
          ),
        ],
      ),
    );
  }
}
