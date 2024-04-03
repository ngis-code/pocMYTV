import 'package:flutter/material.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:timelines/timelines.dart';

import '../../widgets/bezierpainter.dart';

class CruisSchedule extends StatelessWidget {
  CruisSchedule({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    Color completeColor = const Color.fromARGB(255, 162, 164, 179);
    Color inProgressColor = Colors.blueAccent;
    Color todoColor = const Color(0xffd1d2d7);

    const int processIndex = 2;

    Color getColor(int index) {
      if (index == processIndex) {
        return inProgressColor;
      } else if (index < processIndex) {
        return completeColor;
      } else {
        return todoColor;
      }
    }

    final Map<String, Widget> timelines = {
      "Day 1": Text(
        "Day 1",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 2": Text(
        "Day 2",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 3": Text(
        "Day 3",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 4": Text(
        "Day 4",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 5": Text(
        "Day 5",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 6": Text(
        "Day 6",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 7": Text(
        "Day 7",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
    };
    String oppositeContent = 'Demo Opposite Content';

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            SizedBox(
              height: height - 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GlassWidget(
                    padding: const EdgeInsets.all(20.0),
                    backgroundColor: Colors.black26,
                    radius: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.sunny,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "33 °C",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.timeline,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "8:10 AM",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "Florida, Miami",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFFfdde6c),
                          ),
                        ),
                        const Text(
                          "Departure: Aug 12th 07:00 PM",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          focusNode: FocusNode(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFfdde6c),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: Text(
                            'discover your next destination'.toUpperCase(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: height,
                    child: Timeline.tileBuilder(
                      theme: TimelineThemeData(
                        direction: Axis.vertical,
                        connectorTheme: const ConnectorThemeData(
                          space: 10.0,
                          thickness: 5.0,
                        ),
                      ),
                      builder: TimelineTileBuilder.connected(
                        connectionDirection: ConnectionDirection.before,
                        itemExtentBuilder: (_, __) =>
                            (MediaQuery.of(context).size.height - 100) /
                            timelines.length,
                        oppositeContentsBuilder: (context, index) {
                          return GlassWidget(
                            blur: 0,
                            radius: 20,
                            backgroundColor: Colors.black45,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5),
                            child: Text(
                              timelines.keys.toList()[index],
                              style: TextStyle(
                                color: getColor(index),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                        contentsBuilder: (context, index) {
                          return GlassWidget(
                            blur: 0,
                            backgroundColor: Colors.black45,
                            radius: 20,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5),
                            child: Text(
                              oppositeContent,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: getColor(index),
                              ),
                            ),
                          );
                        },
                        indicatorBuilder: (_, index) {
                          Color color;
                          Widget child = Container();
                          if (index == processIndex) {
                            color = inProgressColor;
                            child = const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.directions_boat,
                                  color: Colors.white, size: 15.0),
                            );
                          } else if (index < processIndex) {
                            color = completeColor;
                            child = const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15.0,
                            );
                          } else {
                            color = todoColor;
                          }
                          if (index <= processIndex) {
                            return Stack(
                              children: [
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: CustomPaint(
                                    size: const Size(30.0, 30.0),
                                    painter: BezierPainter(
                                      color: color,
                                      drawStart: index > 0,
                                      drawEnd: index < processIndex,
                                    ),
                                  ),
                                ),
                                DotIndicator(
                                  size: 30.0,
                                  color: color,
                                  child: child,
                                )
                              ],
                            );
                          } else {
                            return Stack(
                              children: [
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: CustomPaint(
                                    size: const Size(15.0, 15.0),
                                    painter: BezierPainter(
                                      color: color,
                                      drawEnd: index < timelines.length - 1,
                                    ),
                                  ),
                                ),
                                OutlinedDotIndicator(
                                  borderWidth: 4.0,
                                  color: color,
                                ),
                              ],
                            );
                          }
                        },
                        connectorBuilder: (_, index, type) {
                          if (index > 0) {
                            if (index == processIndex) {
                              final prevColor = getColor(index - 1);
                              final color = getColor(index);
                              List<Color> gradientColors;
                              if (type == ConnectorType.start) {
                                gradientColors = [
                                  Color.lerp(prevColor, color, 0.5)!,
                                  color
                                ];
                              } else {
                                gradientColors = [
                                  prevColor,
                                  Color.lerp(prevColor, color, 0.5)!
                                ];
                              }
                              return DecoratedLineConnector(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                  ),
                                ),
                              );
                            } else {
                              return SolidLineConnector(
                                indent: 0,
                                color: getColor(index),
                              );
                            }
                          }
                          return null;
                        },
                        itemCount: timelines.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
