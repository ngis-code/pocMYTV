import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:pocmytv/widgets/clock.dart';
import 'package:pocmytv/widgets/drawer_row.dart';
import 'package:pocmytv/widgets/focus_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://www.cruisehive.com/wp-content/uploads/2023/12/cococay1.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black.withOpacity(1),
                      Colors.black.withOpacity(0.2),
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
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FocusWidget(
                            onTap: () {
                              log("Mail");
                            },
                            child: const Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Icon(
                                  Icons.mail,
                                  size: 40,
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
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          const Column(
                            children: [
                              Icon(
                                Icons.thermostat,
                                size: 40,
                                color: Colors.white,
                              ),
                              Text(
                                '24°C',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ClockWidget(
                                builder: (context, time) {
                                  return Text(
                                    '${time.hour}:${time.minute}',
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: GlassWidget(
                          blur: 5,
                          radius: 20,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Welcome to our Hotel Name",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                  ),
                                ),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: 5,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      '5.0',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
      ),
    );
  }
}
