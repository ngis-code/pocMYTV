import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocmytv/extensions/string_extensions.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/home/home_tile.dart';
import 'package:pocmytv/screens/notification/notification_screen.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:pocmytv/widgets/clock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> data = {
      'time': ['6:00 PM', '8:00 PM', '10:00 PM'],
      'event': ['Dinner', 'Show', 'Dance Party'],
      'location': ['Main Dining Room', 'Theater', 'Pool Deck'],
    };
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
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
          Column(
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
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FocusWidget(
                            focusGroup: 'mailButton',
                            onTap: () {
                              showGeneralDialog(
                                context: context,
                                barrierColor: Colors.transparent,
                                pageBuilder: (context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return const Dialog(
                                      backgroundColor: Colors.black45,
                                      child: NotificationScreen());
                                },
                                barrierDismissible: true,
                                barrierLabel: MaterialLocalizations.of(context)
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          // const VerticalDivider(
                          //   width: 50,
                          //   color: Colors.white,
                          //   thickness: 1,
                          // ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      runAlignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.end,
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
                                  border: TableBorder.all(color: Colors.white),
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
                ),
              ),
            ],
          ),
        ],
      ),
      // ),
    );
  }
}
