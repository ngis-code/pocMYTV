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
  final int focusedItem;
  const TVDrawer({super.key, required this.focusedItem});

  @override
  State<TVDrawer> createState() => _TVDrawerState();
}

class _TVDrawerState extends State<TVDrawer> {
  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'tvdrawer',
      child: Material(
        color: const Color.fromARGB(211, 13, 13, 13),
        child: SizedBox(
          width: 240,
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
                  duration: const Duration(milliseconds: 200),
                  expandedItemHeight: 90,
                  itemHeight: 90,
                  focusedItem: widget.focusedItem,
                  focusGroup: 'drawer',
                  focusColor: Colors.transparent,
                  borderColor: Colors.transparent,
                  itemBuilder: (context, index, hasFocus) {
                    return ListTile(
                      title: Text(
                        TVDrawer.drawerItems.keys.elementAt(index)[0],
                        style: TextStyle(
                          color: hasFocus || widget.focusedItem == index
                              ? Colors.white
                              : Colors.white38,
                          fontSize:
                              hasFocus || widget.focusedItem == index ? 15 : 10,
                        ),
                      ),
                      leading: Icon(
                        TVDrawer.drawerItems.keys.elementAt(index)[1],
                        color: Colors.white,
                        size: hasFocus || widget.focusedItem == index ? 25 : 20,
                      ),
                    );
                  },
                  onFocusChange: (index) {
                    // if (!initialized) {
                    //   initialized = true;
                    //   log("Returning without navigating to a different screen");
                    //   return;
                    // }
                    // if (index != widget.focusedItem) {
                    //   log("Navigating to a different screen");
                    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //     builder: (context) =>
                    //         TVDrawer.drawerItems.values.elementAt(index),
                    //   ));
                    // }
                  },
                  onTap: (index) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          TVDrawer.drawerItems.values.elementAt(index),
                    ));
                  },
                  itemCount: TVDrawer.drawerItems.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
