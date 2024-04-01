import 'package:flutter/material.dart';
import 'package:pocmytv/screens/home/home.dart';
import '../screens/time_line/cruise_schedule_screen.dart';
import '../screens/video_on_demand/genre_choose_screen.dart';

class TVDrawer extends StatefulWidget {
  const TVDrawer({super.key});

  @override
  State<TVDrawer> createState() => _TVDrawerState();
}

class _TVDrawerState extends State<TVDrawer> {
  static final Map<List, Widget> drawerItems = {
    ['Home', Icons.home]: const HomePage(),
    ['Movies', Icons.movie]: const GenreChooseScreen(),
    ['TV Shows', Icons.tv]: CruisSchedule(),
    ['Settings', Icons.settings]: const HomePage(),
    ['News', Icons.newspaper]: const HomePage(),
    ['Cloud', Icons.cloud_rounded]: const HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView.builder(
      itemBuilder: (context, index) {
        index = index % drawerItems.length;
        return ListTile(
          title: Text(drawerItems.keys.elementAt(index)[0]),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => drawerItems.values.elementAt(index),
            ));
          },
          leading: Icon(drawerItems.keys.elementAt(index)[1]),
        );
      },
    ));
  }
}
