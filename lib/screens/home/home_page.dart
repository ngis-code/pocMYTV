import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:pocmytv/extensions/string_extensions.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/models/timelines/timeline.dart';
import 'package:pocmytv/screens/home/home_tile.dart';
import 'package:pocmytv/screens/notification/notification_screen.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:pocmytv/widgets/bezierpainter.dart';
import 'package:pocmytv/widgets/clock.dart';
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

  Color completeColor = Colors.green;
  Color inProgressColor = Colors.blueAccent;
  Color todoColor = const Color(0xffd1d2d7);
  bool docked = false;
  double start = 0.41176470588235294117647058823529;
  double end = 0.45294117647058823529411764705882;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // calculateImageDimension('https://mytvpocroyal.com/uploads/island.png')
      //     .then((value) {
      //   setState(() {
      //     imageHeight = value.height;
      //     imageWidth = value.width;
      //   });
      // });
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
      'event': ['Dinner', 'Show', 'Dance Party'],
      'location': ['Main Dining Room', 'Theater', 'Pool Deck'],
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
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        docked = !docked;
                                      });
                                    },
                                    child: const Text("Dock and UnDock")),
                                const VerticalDivider(
                                  width: 50,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                FocusWidget(
                                  focusGroup: 'mailButton',
                                  onTap: () {
                                    showGeneralDialog(
                                      context: context,
                                      barrierColor: Colors.transparent,
                                      pageBuilder: (context,
                                          Animation<double> animation,
                                          Animation<double>
                                              secondaryAnimation) {
                                        return const Dialog(
                                            backgroundColor: Colors.black45,
                                            child: NotificationScreen());
                                      },
                                      barrierDismissible: true,
                                      barrierLabel:
                                          MaterialLocalizations.of(context)
                                              .modalBarrierDismissLabel,
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      transitionBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(0, -1),
                                            end: Offset.zero,
                                          ).animate(
                                            CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.easeInOut,
                                            ),
                                          ),
                                          child: SlideTransition(
                                            position: Tween<Offset>(
                                              begin: Offset.zero,
                                              end: const Offset(0, -1),
                                            ).animate(
                                              CurvedAnimation(
                                                parent: secondaryAnimation,
                                                curve: Curves.easeInOut,
                                              ),
                                            ),
                                            child: child,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: const Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Icon(
                                        Icons.mail_outline_outlined,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                      Positioned(
                                        bottom: -5,
                                        left: 10,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: 10,
                                          child: Text(
                                            "2",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const VerticalDivider(
                                  width: 50,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black45,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              'GANGWAY',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4,
                                              horizontal: 10,
                                            ),
                                            color: Colors.white,
                                            child: Text(
                                              'DECK 5',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                    color: Colors.black,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black45,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              'All Board'.toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4,
                                              horizontal: 10,
                                            ),
                                            color: Colors.white,
                                            child: RichText(
                                              text: TextSpan(
                                                text: '  5:00',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        color: Colors.black),
                                                children: [
                                                  TextSpan(
                                                    text: ' PM  ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color:
                                                                Colors.black),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalDivider(
                                  width: 50,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: "76°",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  color: Colors.white,
                                                ),
                                            children: [
                                              TextSpan(
                                                text: " / 24°C ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                              const WidgetSpan(
                                                  child: SizedBox(width: 10))
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              color: Colors.white,
                                              elevation: 0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      CupertinoIcons.sunrise,
                                                      size: 18,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text('6:30 AM',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith()),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              color: Colors.black26,
                                              elevation: 0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      CupertinoIcons.sunset,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      '8:40 PM',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          CupertinoIcons.sun_max,
                                          size: 50,
                                          color: Color(0xffd6e14a),
                                        ),
                                        Text(
                                          'Sunny',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const VerticalDivider(
                                  width: 50,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                ClockWidget(
                                  builder: (context, time) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          DateFormat('EEEE, MMMM d')
                                              .format(DateTime.now()),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
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
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Image.network(
                'https://mytvpocroyal.com/uploads/island.png',
                height: height,
              ).animate(target: docked ? 0 : 1).moveX(begin: 0, end: width),
            ),
            Positioned.fill(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Transform.translate(
                              offset: Offset(
                                docked
                                    ? width / 35
                                    : 0, // Change these values to move the ship
                                docked
                                    ? height / 2.8
                                    : 0, // Change these values to move the ship
                              ),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Image.asset(
                                  'assets/ship.png',
                                  fit: BoxFit.contain,
                                ),
                              )
                                  .animate(
                                    target: docked ? 1 : 0,
                                  )
                                  .moveY(
                                    begin: 0,
                                    end: width / 4,
                                  )
                                  .scaleXY(
                                    end: 0.2,
                                    begin: 1,
                                    duration: const Duration(milliseconds: 500),
                                  )
                                  .rotate(
                                    begin: 0,
                                    end: -0.17,
                                    duration: const Duration(milliseconds: 500),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height,
                    width: docked ? 0 : width / 3,
                    child: Stack(
                      children: [
                        Timeline.tileBuilder(
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
                                radius: 20,
                                backgroundColor: Colors.black45,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: Text(
                                  TimeLineModel.timelines[index].title,
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
                                  TimeLineModel.timelines[index].description,
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
                                          drawEnd: index <
                                              TimeLineModel.processIndex,
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
                                              TimeLineModel.timelines.length -
                                                  1,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
            if (false)
              HomeTile(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s Itinerary',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      'Marselles, France',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Tomorrow\'s Itinerary',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      'Florence, Italy',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            GlassWidget(
              radius: 10,
              child: Container(
                color: Colors.black45,
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      'UPCOMING EVENTS',
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
            GlassWidget(
              radius: 10,
              child: Container(
                color: Colors.black26,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Text(
                      'TV On The Go'.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                    Image.asset(
                      'assets/images/qrcode.png',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
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
