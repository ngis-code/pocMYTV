import 'package:flutter/material.dart';

class BottomMenuModel {
  String title;
  String description;
  IconData icon;

  BottomMenuModel({
    required this.title,
    required this.description,
    required this.icon,
  });
  static List<BottomMenuModel> allBottomMenu = [
    BottomMenuModel(
      title: "VOD",
      description: "Watch your favorite show",
      icon: Icons.tv_rounded,
    ),
    BottomMenuModel(
      title: "Schedule",
      description: "Cruise Schedule",
      icon: Icons.timeline,
    ),
    BottomMenuModel(
      title: "Hotel Info",
      description: "Know about the hotel",
      icon: Icons.hotel_rounded,
    ),
    BottomMenuModel(
      title: "Weather",
      description: "Check the weather",
      icon: Icons.cloud_rounded,
    ),
    BottomMenuModel(
      title: "Restaurant & Bars",
      description: "Browse your favorite place",
      icon: Icons.restaurant_rounded,
    ),
    BottomMenuModel(
      title: "News",
      description: "Don't Miss Any News",
      icon: Icons.newspaper_rounded,
    ),
  ];
}
