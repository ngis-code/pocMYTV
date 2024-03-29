import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pocmytv/home_bottom_tile.dart';

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
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        scrollDirection: Axis.horizontal,
        children: [
          HomeBottomTile(
            description: "Watch your favorite show",
            title: "TV",
            icon: Icons.tv_rounded,
            onTap: () {
              log("TV");
            },
          ),
          HomeBottomTile(
            description: "Listen to your fav radio",
            title: "Radio",
            icon: Icons.radio_rounded,
            onTap: () {
              log("TV");
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
