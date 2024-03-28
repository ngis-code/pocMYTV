import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:pocmytv/clock.dart';
import 'package:pocmytv/home_bottom_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Stack(
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
                  const SizedBox(
                    height: 100,
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
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
                  const SizedBox(
                    height: 100,
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
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
                        DateFormat('EEEE, MMMM d').format(DateTime.now()),
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
            const SizedBox(
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Welcome to our Hotel\nName",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 5,
                          itemBuilder: (context, index) => const Icon(
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: RawScrollbar(
                thumbColor: Colors.white,
                trackColor: Colors.black,
                trackVisibility: true,
                padding: const EdgeInsets.only(bottom: -20),
                controller: scrollController,
                scrollbarOrientation: ScrollbarOrientation.bottom,
                thickness: 10, //According to your choice
                thumbVisibility: true, //
                child: GridView.extent(
                  maxCrossAxisExtent: 1000,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  scrollDirection: Axis.horizontal,
                  children: [
                    HomeBottomTile(
                      description: "Watch your favorite show",
                      title: "TV",
                      icon: Icons.tv_rounded,
                      onTap: () {
                        log("TV");
                      },
                    ),
                    HomeBottomTile(
                      description: "Listen to your fav radio",
                      title: "Radio",
                      icon: Icons.radio_rounded,
                      onTap: () {
                        log("TV");
                      },
                    ),
                    HomeBottomTile(
                      description: "Know about the hotel",
                      title: "Hotel Info",
                      icon: Icons.hotel_rounded,
                      onTap: () {
                        log("TV");
                      },
                    ),
                    HomeBottomTile(
                      description: "Check the weather",
                      title: "Weather",
                      icon: Icons.cloud_rounded,
                      onTap: () {
                        log("TV");
                      },
                    ),
                    HomeBottomTile(
                      description: "Browse your favorite place",
                      title: "Restaurant & Bars",
                      icon: Icons.restaurant_rounded,
                      onTap: () {
                        log("TV");
                      },
                    ),
                    HomeBottomTile(
                      description: "Don't Miss Any News",
                      title: "News",
                      icon: Icons.newspaper_rounded,
                      onTap: () {
                        log("TV");
                      },
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
