import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pocmytv/extensions/string_extensions.dart';
import 'package:pocmytv/globals.dart';
import 'package:pocmytv/models/timelines/timeline.dart';
import 'package:pocmytv/screens/home/clouds_screen.dart';
import 'package:pocmytv/screens/home/gangway.dart';
import 'package:pocmytv/screens/home/mail_button.dart';
import 'package:pocmytv/screens/home/qr_button.dart';
import 'package:pocmytv/screens/home/safety_button.dart';
import 'package:pocmytv/screens/home/time_home_widget.dart';
import 'package:pocmytv/screens/home/weather_time_home_widget.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:pocmytv/widgets/bezierpainter.dart';
import 'package:timelines/timelines.dart';

import '../../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();

  Color getColor(int index) {
    if (index == TimeLineModel.processIndex) {
      return inProgressColor;
    } else if (index < TimeLineModel.processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  Color completeColor = const Color.fromARGB(255, 232, 116, 53);
  Color inProgressColor = darkBlue;
  Color todoColor = const Color(0xffd1d2d7);
  bool docked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //getTimelines().then((value) {
      //setState(() {
      //  TimeLineModel.timelines.addAll(value);
      //});
      //getCurrentTimeline().then((value) {
      //  setState(() {
      //    TimeLineModel.processIndex = value;
      //    docked = TimeLineModel.timelines[TimeLineModel.processIndex].dock;
      //  });
      //});
      //});
      setState(() {
        docked = TimeLineModel.timelines[TimeLineModel.processIndex].dock;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final Map<String, List<String>> data = {
      'time': ['6:00 PM', '8:00 PM', '10:00 PM'],
      'event': ['Landons Spa Apt', 'Show', 'Dance Party'],
      'location': ['Deck 5 Spa', 'Theater', 'Pool Deck'],
    };
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 130,
          actions: [
            SizedBox(
              width: width,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 20, bottom: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
                child: SizedBox(
                  height: 90,
                  child: Row(
                    children: [
                      Image.asset('assets/images/logo.png',
                          height: 300, color: Colors.white),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MailButton(),
                                VerticalDivider(
                                  width: 50,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                SafetyButton(),
                                VerticalDivider(
                                  width: 50,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                QrButton(),
                                VerticalDivider(
                                  width: 50,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                GangwayWidget(),
                                VerticalDivider(
                                  width: 50,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                WaetherTimeHomeWidget(),
                                VerticalDivider(
                                  width: 50,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                TimeHomeWidget()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
      body: GestureDetector(
        onTap: () {
          TVDrawer.drawerHidden.value = !TVDrawer.drawerHidden.value;
          // TVDrawer.drawerHidden.value = true;
        },
        onLongPress: () {
          setState(() {
            docked = !docked;
          });
        },
        child: Stack(
          children: [
            // Island
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                'assets/island.png',
                height: height,
              )
                  .animate(target: docked ? 1 : 0)
                  .then(delay: const Duration(seconds: 1))
                  .moveX(
                    begin: math.max(width, height) * 2,
                    end: 0,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  ),
            ),
            // The ship for island
            Positioned(
              right: height / 1.4,
              bottom: -40,
              child: Container(
                transform: Matrix4.rotationZ(-1.075),
                child: Image.asset(
                  'assets/ship.png',
                  width: height / 3.45,
                )
                    .animate(target: docked ? 1 : 0)
                    .then(delay: const Duration(seconds: 3))
                    .moveX(
                      begin: -height / 3.45,
                      end: 0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 1000),
                    ),
              ),
            ),
            // Body
            Positioned.fill(
              child: Row(
                children: [
                  // Ship
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: RotatedBox(
                        quarterTurns: 0,
                        child: Image.asset(
                          'assets/ship.png',
                          fit: BoxFit.contain,
                        ),
                      )
                          .animate(target: docked ? 1 : 0)
                          .moveX(
                            begin: 0,
                            end: width,
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 1000),
                          )
                          .then(delay: const Duration(seconds: 1)),
                    ),
                  ),
                  // Timeline
                  SizedBox(
                    height: height,
                    width: width / 3,
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
                            (height - 150) / TimeLineModel.timelines.length,
                        oppositeContentsBuilder: (context, index) {
                          return GlassWidget(
                            blur: 0,
                            borderRadius: 20,
                            backgroundColor: Colors.black45,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5),
                            child: Text(
                              TimeLineModel.timelines[index].title,
                              style: TextStyle(
                                color: index == TimeLineModel.processIndex
                                    ? Colors.white
                                    : getColor(index),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                        contentsBuilder: (context, index) {
                          return GlassWidget(
                            blur: 0,
                            backgroundColor: Colors.black45,
                            borderRadius: 20,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5),
                            child: Text(
                              TimeLineModel.timelines[index].description,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: index == TimeLineModel.processIndex
                                    ? Colors.white
                                    : getColor(index),
                              ),
                            ),
                          );
                        },
                        indicatorBuilder: (_, index) {
                          Color color;
                          Widget child = Container();
                          if (index == TimeLineModel.processIndex) {
                            color = inProgressColor;
                            child = const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.directions_boat,
                                  color: Colors.white, size: 15.0),
                            );
                          } else if (index < TimeLineModel.processIndex) {
                            color = completeColor;
                            child = const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15.0,
                            );
                          } else {
                            color = todoColor;
                          }
                          if (index <= TimeLineModel.processIndex) {
                            return Stack(
                              children: [
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: CustomPaint(
                                    size: const Size(30.0, 30.0),
                                    painter: BezierPainter(
                                      color: color,
                                      drawStart: index > 0,
                                      drawEnd:
                                          index < TimeLineModel.processIndex,
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
                                      drawEnd: index <
                                          TimeLineModel.timelines.length - 1,
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
                            if (index == TimeLineModel.processIndex) {
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
                        itemCount: TimeLineModel.timelines.length,
                      ),
                    )
                        .animate(target: docked ? 1 : 0)
                        .moveX(begin: 0, end: width / 3),
                  ),
                ],
              ),
            ),
            // Clouds Animation (You can comment below line to hide the clouds)
            if (showClouds) const Positioned.fill(child: CloudsScreen()),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 100.0, right: width / 3 - 100),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          runAlignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          alignment: WrapAlignment.spaceBetween,
          children: [
            GlassWidget(
              borderRadius: 10,
              child: Container(
                color: const Color.fromARGB(255, 232, 116, 53),
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      "LANDON'S CALENDAR",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                    DataTable(
                      columnSpacing: 2,
                      headingRowHeight: 30,
                      showBottomBorder: false,
                      dataTextStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.black,
                              ),
                      headingTextStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                      dividerThickness: 0,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      border: TableBorder.symmetric(
                        inside: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      headingRowColor: MaterialStateColor.resolveWith(
                        (states) {
                          return Colors.white.withOpacity(.8);
                        },
                      ),
                      columns: [
                        ...data.keys.map(
                          (e) => DataColumn(
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                e.toPascalCase(),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ),
                      ],
                      rows: [
                        for (int i = 0; i < data['time']!.length; i++)
                          DataRow(
                            color: MaterialStateColor.resolveWith(
                              (states) {
                                return Colors.white;
                              },
                            ),
                            cells: [
                              DataCell(Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(data['time']![i],
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith()),
                              )),
                              DataCell(Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(data['event']![i],
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith()),
                              )),
                              DataCell(Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(data['location']![i],
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith()),
                              )),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
