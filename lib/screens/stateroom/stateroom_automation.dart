import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/screens/stateroom/stateroom_air_conditioner_widget.dart';
import 'package:pocmytv/screens/stateroom/stateroom_light_widget.dart';
import 'package:pocmytv/screens/stateroom/stateroom_weather_widget.dart';
import 'package:pocmytv/screens/stateroom/widgets/music_player.dart';
import 'package:pocmytv/screens/stateroom/widgets/stateroom_stats_tile.dart';
import 'package:pocmytv/screens/stateroom/widgets/stateroom_theme_row.dart';
import 'package:pocmytv/screens/stateroom/widgets/stateroom_time_widget.dart';
import 'package:pocmytv/utils/glass_widget.dart';

const Color tileBackgroundColor = Colors.white24;
double tilePadding = 20;

class StateroomAutomationScreen extends StatelessWidget {
  const StateroomAutomationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (math.min(height, width) < 650) {
      tilePadding = 10;
    } else {
      tilePadding = 20;
    }
    return BubbleAnimation(
      child: BackgroundVideo(
        backgroundWidget: Container(),
        child: Padding(
          padding: EdgeInsets.all(tilePadding),
          child: GlassWidget(
            backgroundColor: Colors.white12,
            borderRadius: 20,
            padding: EdgeInsets.all(tilePadding),
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Expanded(child: StateroomTimeWidget()),
                                  SizedBox(width: tilePadding),
                                  const Expanded(
                                      child: StateroomWeatherWidget()),
                                ],
                              ),
                            ),
                            SizedBox(height: tilePadding),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Expanded(
                                    child: StateroomLightWidget(
                                      hasFocus: true,
                                      offIcon: Icons.lightbulb_outlined,
                                      onIcon: Icons.lightbulb,
                                      lightType: "Main",
                                    ),
                                  ),
                                  SizedBox(width: tilePadding),
                                  const Expanded(
                                    child: StateroomLightWidget(
                                      offIcon: Icons.laptop,
                                      onIcon: Icons.laptop,
                                      lightType: "Desk",
                                    ),
                                  ),
                                  SizedBox(width: tilePadding),
                                  const Expanded(
                                    child: StateroomLightWidget(
                                      offIcon: Icons.light_rounded,
                                      onIcon: Icons.light_rounded,
                                      lightType: "Balcony",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: tilePadding),
                      const Expanded(
                        child: StateroomAirConditionerWidget(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: tilePadding),
                Flexible(
                  flex: 5,
                  child: Column(
                    children: [
                      const Expanded(child: MusicPlayer()),
                      SizedBox(height: tilePadding),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: StateroomStatsTile(
                                      title: "Total Consumption",
                                      value: "2,7",
                                      unit: "kWH",
                                      icon: Icons.electrical_services_rounded,
                                    ),
                                  ),
                                  SizedBox(width: tilePadding),
                                  const Expanded(
                                    child: StateroomStatsTile(
                                      title: "Humidity",
                                      value: "54.0",
                                      unit: "%",
                                      icon: Icons.water_drop,
                                    ),
                                  ),
                                  SizedBox(width: tilePadding),
                                  const Expanded(
                                    child: StateroomStatsTile(
                                      title: "Pressure",
                                      value: "1008",
                                      unit: "hPA",
                                      icon: Icons.speed,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: tilePadding),
                            const Expanded(
                              child: StateroomThemeRow(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
