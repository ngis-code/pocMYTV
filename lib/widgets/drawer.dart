import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pocmytv/screens/account/account_screen.dart';
import 'package:pocmytv/screens/home/home_page.dart';
import 'package:pocmytv/screens/live_tv/live_tv_screen.dart';
import 'package:pocmytv/screens/safety/safety_screen.dart';
import 'package:pocmytv/widgets/centered_list_view.dart';

import '../screens/time_line/cruise_schedule_screen.dart';
import '../screens/video_on_demand/genre_choose_screen.dart';

class TVDrawer extends StatefulWidget {
  static const Map<List, Widget> drawerItems = {
    ['Home', Icons.home]: HomePage(),
    ['Safety Information', Icons.newspaper]: SafetyScreen(),
    ['Live TV', Icons.movie]: LiveTvScreen(),
    ['Video On Demand', Icons.tv]: GenreChooseScreen(),
    ['Ship Information', Icons.settings]: CruisSchedule(),
    ['Account', Icons.cloud_rounded]: AccountScreen(),
  };
  static double height = 240;
  static final ValueNotifier<bool> safetyLocked =
      ValueNotifier(kDebugMode ? false : true);
  static final ValueNotifier<bool> drawerHidden = ValueNotifier(true);
  const TVDrawer({super.key});

  @override
  State<TVDrawer> createState() => _TVDrawerState();
}

class _TVDrawerState extends State<TVDrawer> {
  bool initialized = false;
  int focusedItem = TVDrawer.safetyLocked.value ? 1 : 0;
  int count = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      TVDrawer.drawerHidden.addListener(changeState);
    });
  }

  @override
  void dispose() {
    TVDrawer.drawerHidden.removeListener(changeState);
    super.dispose();
  }

  void changeState() {
    setState(() {});
  }

  void hideDrawer() async {
    int tmp = ++count;
    await Future.delayed(const Duration(milliseconds: 1));
    if (count == tmp) {
      TVDrawer.height = 80;
      TVDrawer.drawerHidden.value = true;
    }
  }

  void showDrawer() async {
    count++;
    TVDrawer.height = 240;
    TVDrawer.drawerHidden.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TVDrawer.safetyLocked,
      builder: (context, safetyLocked, child) {
        return Hero(
          tag: 'tvdrawer',
          child: Material(
            color: const Color.fromARGB(211, 13, 13, 13),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: TVDrawer.height,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    TVDrawer.drawerHidden.value ? "" : "Welcome Byron Family",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final height = constraints.maxHeight;
                        return CenteredListView(
                          disabledItems: safetyLocked
                              ? [true, false, true, true, true, true, true]
                              : [],
                          duration: const Duration(milliseconds: 200),
                          expandedItemHeight: height / 6,
                          itemHeight: height / 6,
                          focusedItem: focusedItem,
                          focusGroup: 'drawer',
                          focusColor: Colors.transparent,
                          borderColor: Colors.transparent,
                          itemBuilder: (context, index, hasFocus) {
                            return ListTile(
                              title: Text(
                                TVDrawer.drawerHidden.value
                                    ? ""
                                    : TVDrawer.drawerItems.keys
                                        .elementAt(index)[0],
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    color: TVDrawer.safetyLocked.value &&
                                            focusedItem == index
                                        ? Colors.red
                                        : hasFocus || focusedItem == index
                                            ? Colors.white
                                            : Colors.white38,
                                    fontSize: hasFocus || focusedItem == index
                                        ? 15
                                        : 10,
                                    fontWeight: hasFocus
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                              leading: Icon(
                                TVDrawer.drawerItems.keys.elementAt(index)[1],
                                color: Colors.white,
                                size:
                                    hasFocus || focusedItem == index ? 25 : 20,
                              ),
                            );
                          },
                          onFocusLost: () {
                            hideDrawer();
                          },
                          onFocusChange: (index) {
                            showDrawer();
                            if (index != focusedItem) {
                              focusedItem = index;
                            }
                          },
                          onTap: (index) {
                            if (index != focusedItem) {
                              setState(() {
                                focusedItem = index;
                              });
                            }
                          },
                          itemCount: TVDrawer.drawerItems.length,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
