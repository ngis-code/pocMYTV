import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pocmytv/screens/account/account_screen.dart';
import 'package:pocmytv/screens/home/home_bottom_tile.dart';
import 'package:pocmytv/screens/live_tv/live_tv_screen.dart';
import 'package:pocmytv/screens/safety/safety_screen.dart';
import 'package:pocmytv/screens/time_line/cruise_schedule_screen.dart';
import 'package:pocmytv/screens/video_on_demand/genre_choose_screen.dart';
import 'package:pocmytv/widgets/drawer.dart';

class HomeBottomTiles extends StatelessWidget {
  HomeBottomTiles({super.key});

  int count = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TVDrawer.drawerHidden,
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeBottomTile(
            color: const Color(0xff1f1f1f).withAlpha(190),
            onFocusChange: onFocusChange,
            description: "Check the safety information",
            title: "Safety Information",
            icon: Icons.health_and_safety_rounded,
            page: const SafetyScreen(),
          ),
          HomeBottomTile(
            color: const Color(0xff1f1f1f).withAlpha(190),
            onFocusChange: onFocusChange,
            description: "Watch shows and movies",
            title: "Live TV",
            icon: Icons.tv_rounded,
            page: const LiveTvScreen(),
          ),
          HomeBottomTile(
            color: const Color(0xff1f1f1f).withAlpha(190),
            onFocusChange: onFocusChange,
            description: "Watch your favorite shows and movies",
            title: "VOD",
            icon: Icons.ondemand_video_rounded,
            page: const GenreChooseScreen(),
          ),
          HomeBottomTile(
            color: const Color(0xff1f1f1f).withAlpha(190),
            onFocusChange: onFocusChange,
            description: "Cruise Schedule",
            title: "Schedule",
            icon: Icons.timeline,
            page: const CruisSchedule(),
          ),
          HomeBottomTile(
            color: const Color(0xff1f1f1f).withAlpha(190),
            onFocusChange: onFocusChange,
            description: "Account Information",
            title: "Account",
            icon: Icons.cloud_rounded,
            page: const AccountScreen(),
          ),
        ],
      ).animate(target: TVDrawer.drawerHidden.value ? 1 : 0).moveY(
            curve: Curves.easeInOut,
            begin: 0,
            end: height,
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
