import 'package:flutter/material.dart';
import 'package:pocmytv/screens/home/home_page.dart';
import 'package:pocmytv/widgets/centered_list_view.dart';

import '../screens/time_line/cruise_schedule_screen.dart';
import '../screens/video_on_demand/genre_choose_screen.dart';

class TVDrawer extends StatefulWidget {
  static final Map<List, Widget> drawerItems = {
    ['Home', Icons.home]: const HomePage(),
    ['Movies', Icons.movie]: const GenreChooseScreen(),
    ['TV Shows', Icons.tv]: CruisSchedule(),
    ['Settings', Icons.settings]: const HomePage(),
    ['News', Icons.newspaper]: const HomePage(),
    ['Cloud', Icons.cloud_rounded]: const HomePage(),
  };

  final int focusedItem;

  const TVDrawer({super.key, required this.focusedItem});

  @override
  State<TVDrawer> createState() => _TVDrawerState();
}

class _TVDrawerState extends State<TVDrawer> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'tvdrawer',
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: 200,
          child: CenteredListView(
            duration: const Duration(milliseconds: 200),
            expandedItemHeight: 90,
            itemHeight: 90,
            focusedItem: widget.focusedItem,
            borderColor: Colors.transparent,
            itemBuilder: (context, index, hasFocus) {
              return ListTile(
                title: Text(
                  TVDrawer.drawerItems.keys.elementAt(index)[0],
                  style: TextStyle(
                    color: hasFocus ? Colors.white : Colors.white38,
                    fontSize: hasFocus ? 24 : 20,
                  ),
                ),
                leading: Icon(
                  TVDrawer.drawerItems.keys.elementAt(index)[1],
                  color: Colors.white,
                  size: hasFocus ? 30 : 25,
                ),
              );
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
      ),
    );
  }
}
