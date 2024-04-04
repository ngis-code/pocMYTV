import 'package:flutter/material.dart';
import 'package:pocmytv/screens/account/account_screen.dart';
import 'package:pocmytv/screens/home/home_page.dart';
import 'package:pocmytv/screens/live_tv/live_tv_screen.dart';
import 'package:pocmytv/screens/safety/safety_screen.dart';
import 'package:pocmytv/widgets/centered_list_view.dart';

import '../screens/time_line/cruise_schedule_screen.dart';
import '../screens/video_on_demand/genre_choose_screen.dart';

class TVDrawer extends StatefulWidget {
  static final Map<List, Widget> drawerItems = {
    ['Home', Icons.home]: const HomePage(),
    ['Safety Information', Icons.newspaper]: const SafetyScreen(),
    ['Live TV', Icons.movie]: const LiveTvScreen(),
    ['Video On Demand', Icons.tv]: const GenreChooseScreen(),
    ['Ship Information', Icons.settings]: CruisSchedule(),
    ['Account', Icons.cloud_rounded]: const AccountScreen(),
  };
  static const double width = 240;
  final void Function(int index)? onPageChange;
  static final ValueNotifier<bool> safetyLocked = ValueNotifier(true);
  const TVDrawer({super.key, this.onPageChange});

  @override
  State<TVDrawer> createState() => _TVDrawerState();
}

class _TVDrawerState extends State<TVDrawer> {
  bool initialized = false;
  int focusedItem = TVDrawer.safetyLocked.value ? 1 : 0;

  @override
  void initState() {
    super.initState();
    widget.onPageChange?.call(focusedItem);
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
            child: SizedBox(
              width: TVDrawer.width,
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
                  const Text(
                    "Welcome Byron Family",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: CenteredListView(
                      disabledItems: safetyLocked
                          ? [true, false, true, true, true, true, true]
                          : [],
                      duration: const Duration(milliseconds: 200),
                      expandedItemHeight: 80,
                      itemHeight: 80,
                      focusedItem: focusedItem,
                      focusGroup: 'drawer',
                      focusColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      itemBuilder: (context, index, hasFocus) {
                        return ListTile(
                          title: Text(
                            TVDrawer.drawerItems.keys.elementAt(index)[0],
                            style: TextStyle(
                                color: TVDrawer.safetyLocked.value &&
                                        focusedItem == index
                                    ? Colors.red
                                    : hasFocus || focusedItem == index
                                        ? Colors.white
                                        : Colors.white38,
                                fontSize:
                                    hasFocus || focusedItem == index ? 15 : 10,
                                fontWeight: hasFocus
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          leading: Icon(
                            TVDrawer.drawerItems.keys.elementAt(index)[1],
                            color: Colors.white,
                            size: hasFocus || focusedItem == index ? 25 : 20,
                          ),
                        );
                      },
                      onFocusChange: (index) {
                        // if (!initialized) {
                        //   initialized = true;
                        //   log("Returning without navigating to a different screen");
                        //   return;
                        // }
                        // if (index != focusedItem) {
                        //   log("Navigating to a different screen");
                        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (context) =>
                        //         TVDrawer.drawerItems.values.elementAt(index),
                        //   ));
                        // }
                        if (index != focusedItem) {
                          focusedItem = index;
                          widget.onPageChange?.call(focusedItem);
                        }
                      },
                      onTap: (index) {
                        // Navigator.of(context).pushReplacement(animatedPageRoute(
                        //   child: TVDrawer.drawerItems.values.elementAt(index),
                        //   begin: Offset(0, focusedItem > index ? -1 : 1),
                        //   end: Offset.zero,
                        // ));
                        if (index != focusedItem) {
                          setState(() {
                            focusedItem = index;
                          });
                          widget.onPageChange?.call(focusedItem);
                        }
                      },
                      itemCount: TVDrawer.drawerItems.length,
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
