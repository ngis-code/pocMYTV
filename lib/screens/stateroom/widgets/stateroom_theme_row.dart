import 'package:flutter/material.dart';
import 'package:pocmytv/screens/stateroom/stateroom_automation.dart';
import 'package:pocmytv/screens/stateroom/widgets/stateroom_theme_tile.dart';

class StateroomThemeRow extends StatefulWidget {
  const StateroomThemeRow({super.key});

  @override
  State<StateroomThemeRow> createState() => _StateroomThemeRowState();
}

class _StateroomThemeRowState extends State<StateroomThemeRow> {
  int chosenTheme = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StateroomThemeTile(
            title: "Daytime Theme",
            icon: Icons.wb_sunny,
            onTap: () {
              setState(() {
                chosenTheme = 0;
              });
            },
            chosen: chosenTheme == 0,
          ),
        ),
        SizedBox(width: tilePadding),
        Expanded(
          child: StateroomThemeTile(
            title: "Movie Theme",
            icon: Icons.movie,
            onTap: () {
              setState(() {
                chosenTheme = 1;
              });
            },
            chosen: chosenTheme == 1,
          ),
        ),
        SizedBox(width: tilePadding),
        Expanded(
          child: StateroomThemeTile(
            title: "Bedtime Theme",
            icon: Icons.nightlight_round,
            onTap: () {
              setState(() {
                chosenTheme = 2;
              });
            },
            chosen: chosenTheme == 2,
          ),
        ),
      ],
    );
  }
}
