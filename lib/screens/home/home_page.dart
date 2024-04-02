import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocmytv/extensions/string_extensions.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/home/home_tile.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:pocmytv/widgets/clock.dart';
import 'package:pocmytv/widgets/drawer_row.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool initialized = false;
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {
    //     initialized = true;
    //   });
    // });
    controller = VideoPlayerController.network(
      'https://videos.pond5.com/animated-deep-blue-background-ocean-footage-090878816_main_xxl.mp4',
    );
    controller
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((_) => setState(() {
            initialized = true;
          }))
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> data = {
      'time': ['6:00 PM', '8:00 PM', '10:00 PM'],
      'event': ['Dinner', 'Show', 'Dance Party'],
      'location': ['Main Dining Room', 'Theater', 'Pool Deck'],
    };
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        // DecoratedBox(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: NetworkImage(
        //       'https://www.royalcaribbean.com/blog/wp-content/uploads/2017/04/RCI_NV_CC_NMorley_032019_Drone_DJI_0738_RET_CMYK.jpg',
        //     ),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        // child:
        children: [
          if (initialized)
            AspectRatio(
              // it should cover the whole screen
              aspectRatio: width / height,
              child: VideoPlayer(controller),
            ),
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: 1,
              child: Image.asset(
                'assets/ship.png',
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          DrawerRow(
            focusedItem: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.transparent,
                        // Colors.accents[0].withOpacity(0.5),
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: SizedBox(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // const Text(
                        //   "Welcome Byron Family",
                        //   style: TextStyle(color: Colors.white, fontSize: 20),
                        // ),
                        Row(
                          children: [
                            FocusWidget(
                              focusGroup: 'mailButton',
                              onTap: () {
                                log("Mail");
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
                                    left: 11,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 10,
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
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
                                            padding: const EdgeInsets.all(4.0),
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
                                            padding: const EdgeInsets.all(4.0),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                            const VerticalDivider(
                              width: 50,
                              color: Colors.white,
                              thickness: 1,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Padding(
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
                            const VerticalDivider(
                              width: 50,
                              color: Colors.white,
                              thickness: 1,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Padding(
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
                                            .copyWith(color: Colors.black),
                                        children: [
                                          TextSpan(
                                            text: ' PM  ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(color: Colors.black),
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
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          HomeTile(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Today\'s Itinerary',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                Text(
                                  'Marselles, France',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Tomorrow\'s Itinerary',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                Text(
                                  'Florence, Italy',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
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
                                    headingRowHeight: 20,
                                    // dataRowHeight: 20,
                                    horizontalMargin: 10,
                                    dataRowMaxHeight: 40,
                                    dataRowMinHeight: 20,
                                    showBottomBorder: false,
                                    dataTextStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white),
                                    headingTextStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white),
                                    dividerThickness: 1,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    border:
                                        TableBorder.all(color: Colors.white),
                                    columns: [
                                      ...data.keys.map((e) => DataColumn(
                                              label: Text(
                                            e.toPascalCase(),
                                            textAlign: TextAlign.center,
                                          ))),
                                    ],
                                    rows: [
                                      for (int i = 0;
                                          i < data['time']!.length;
                                          i++)
                                        DataRow(
                                          cells: [
                                            DataCell(Text(
                                              data['time']![i],
                                              textAlign: TextAlign.center,
                                            )),
                                            DataCell(Text(
                                              data['event']![i],
                                              textAlign: TextAlign.center,
                                            )),
                                            DataCell(Text(
                                              data['location']![i],
                                              textAlign: TextAlign.center,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                children: [
                                  Text(
                                    'Connect to Wifi'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Image.asset(
                                    'assets/images/qrcode.png',
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 200,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //   GlassWidget(
                      //     blur: 5,
                      //     radius: 20,
                      //     child: Container(
                      //       width: MediaQuery.of(context).size.width / 2,
                      //       padding: const EdgeInsets.all(10),
                      //       decoration: BoxDecoration(
                      //         color: Colors.black.withOpacity(0.5),
                      //       ),
                      //       child: Column(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           const Text(
                      //             "Welcome Byron Family",
                      //             textAlign: TextAlign.left,
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 50,
                      //             ),
                      //           ),
                      //           if (false)
                      //             Row(
                      //               children: [
                      //                 RatingBarIndicator(
                      //                   rating: 5,
                      //                   itemBuilder: (context, index) =>
                      //                       const Icon(
                      //                     Icons.star,
                      //                     color: Colors.amber,
                      //                   ),
                      //                 ),
                      //                 const SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 const Text(
                      //                   '5.0',
                      //                   style: TextStyle(color: Colors.white),
                      //                 ),
                      //               ],
                      //             ),
                      //           if (false)
                      //             const Text(
                      //               "We hope you enjoy your stay on ICON Of The Seas.",
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                //   child: SizedBox(
                //     height: MediaQuery.of(context).size.height / 4,
                //     width: MediaQuery.of(context).size.width,
                //     child: BottomMenuTiles(),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
