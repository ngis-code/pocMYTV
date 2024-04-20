import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocmytv/models/timelines/timeline.dart';
import 'package:pocmytv/models/timelines/timeline_use_cases.dart';
import 'package:pocmytv/pre_loader/pre_loader.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/main_page.dart';
import 'package:pocmytv/services/keyboard_service.dart';
import 'package:pocmytv/widgets/clock.dart';

class ScreenSaver extends StatefulWidget {
  const ScreenSaver({super.key});

  @override
  State<ScreenSaver> createState() => _ScreenSaverState();
}

class _ScreenSaverState extends State<ScreenSaver> {
  @override
  void initState() {
    KeyBoardService.addHandler(_handler);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      PreLoader.load(context);
      getTimelines().then((value) {
        setState(() {
          TimeLineModel.timelines.addAll(value);
        });
        getCurrentTimeline().then((value) {
          setState(() {
            TimeLineModel.processIndex = value;
          });
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    KeyBoardService.removeHandler(_handler);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BubbleAnimation(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            ClockWidget(
              builder: (context, time) {
                return Text(
                  '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
            );
          },
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                    width: 150,
                    color: Colors.white,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: "Welcome to your Stateroom ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        // fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Landon Byron',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '\nWe hope you enjoy ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Ascent',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                    valueListenable: PreLoader.loaded,
                    builder: (context, value, child) {
                      if (value != 1 && !kDebugMode) {
                        return SizedBox(
                          width: 200,
                          child: LinearProgressIndicator(
                            value: value,
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.red),
                            backgroundColor: Colors.white,
                          ),
                        );
                      }
                      return const Text(
                        "Press any key to continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _handler(KeyEvent event) {
    if (event is KeyDownEvent) return false;
    if (PreLoader.loaded.value != 1 && !kDebugMode) {
      log("Assets not loaded yet. You can't continue. Current value: ${PreLoader.loaded.value}",
          name: "ScreenSaverScreen");
      return false;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainPage(),
      ),
    );
    return false;
  }
}
