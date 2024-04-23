import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pocmytv/globals.dart';
import 'package:pocmytv/screens/account/account_screen.dart';
import 'package:pocmytv/screens/guest_service/guest_service_screen.dart';
import 'package:pocmytv/screens/home/home_bottom_tile.dart';
import 'package:pocmytv/screens/live_tv/live_tv_screen.dart';
import 'package:pocmytv/screens/safety/safety_screen.dart';
import 'package:pocmytv/screens/shorex/shorex.dart';
import 'package:pocmytv/screens/stateroom/stateroom_automation.dart';
import 'package:pocmytv/screens/time_line/cruise_schedule_screen.dart';
import 'package:pocmytv/screens/video_on_demand/genre_choose_screen.dart';
import 'package:pocmytv/widgets/drawer.dart';

class HomeBottomTiles extends StatefulWidget {
  const HomeBottomTiles({super.key});

  @override
  State<HomeBottomTiles> createState() => _HomeBottomTilesState();
}

class _HomeBottomTilesState extends State<HomeBottomTiles> {
  int count = 0;
  double height = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      TVDrawer.drawerHidden.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color color = darkBlue.withOpacity(0.5);
    return ValueListenableBuilder(
      valueListenable: TVDrawer.drawerHidden,
      builder: (context, value, child) => Stack(
        children: [
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                children: [
                  const Positioned(
                    child: Text(
                      // "Press down button to see more options",
                      "",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: const Icon(Icons.keyboard_arrow_down_rounded,
                              size: 40, color: Colors.white)
                          .animate(
                            onComplete: (controller) =>
                                controller.repeat(reverse: true),
                          )
                          .moveY(
                            curve: Curves.easeInOut,
                            begin: 0,
                            end: 5,
                            duration: const Duration(milliseconds: 1000),
                          )
                          .then()
                          .moveY(
                            curve: Curves.easeInOut,
                            begin: 0,
                            end: -5,
                            duration: const Duration(milliseconds: 1000),
                          ),
                    ),
                  ),
                ],
              ).animate(target: TVDrawer.drawerHidden.value ? 0 : 1).moveY(
                    curve: Curves.easeInOut,
                    begin: 0,
                    end: height,
                    duration: const Duration(milliseconds: 500),
                  ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 18,
              right: 25,
              left: 25,
              top: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.blue[400]!.withOpacity(.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.5),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeBottomTile(
                  color: color,
                  requestFocus: true,
                  onFocusChange: onFocusChange,
                  description: "Check the safety information",
                  title: "Photo",
                  icon: Icons.photo_album_outlined,
                  page: const SafetyScreen(),
                ),
                HomeBottomTile(
                  color: color,
                  onFocusChange: onFocusChange,
                  description: "Watch shows and movies",
                  title: "Live TV",
                  icon: Icons.tv_rounded,
                  page: const LiveTvScreen(),
                ),
                HomeBottomTile(
                  color: color,
                  onFocusChange: onFocusChange,
                  description: "Watch your favorite shows and movies",
                  title: "Video on Demand",
                  icon: Icons.ondemand_video_rounded,
                  page: const GenreChooseScreen(),
                ),
                HomeBottomTile(
                  color: color,
                  onFocusChange: onFocusChange,
                  description: "Cruise Schedule",
                  title: "Schedule",
                  icon: Icons.timeline,
                  page: const CruisSchedule(),
                ),
                HomeBottomTile(
                  color: color,
                  onFocusChange: onFocusChange,
                  description: "ShoreX",
                  title: "Shore Excursions",
                  icon: Icons.star_border_outlined,
                  page: const ShorexScreen(),
                ),
                HomeBottomTile(
                  color: color,
                  onFocusChange: onFocusChange,
                  description: "StateRoom",
                  title: "StateRoom",
                  icon: Icons.home_rounded,
                  page: const StateroomAutomationScreen(),
                ),
                HomeBottomTile(
                  color: color,
                  onFocusChange: onFocusChange,
                  description: "Guest Relations",
                  title: "Guest Relations",
                  icon: Icons.info_outline_rounded,
                  page: const GuestServiceScreen(),
                ),
                HomeBottomTile(
                  color: color,
                  onFocusChange: onFocusChange,
                  description: "Account Information",
                  title: "Account",
                  icon: Icons.person_rounded,
                  page: const AccountScreen(),
                ),
              ],
            ),
          ).animate(target: TVDrawer.drawerHidden.value ? 1 : 0).moveY(
                curve: Curves.easeInOut,
                begin: 0,
                end: height + 20,
                duration: const Duration(milliseconds: 500),
              ),
        ],
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
    await Future.delayed(const Duration(milliseconds: 100));
    if (count == tmp) {
      TVDrawer.drawerHidden.value = true;
    }
  }

  void showDrawer() async {
    int tmp = ++count;
    TVDrawer.drawerHidden.value = false;
    await Future.delayed(const Duration(seconds: 5));
    if (count == tmp) {
      hideDrawer();
    }
  }
}
