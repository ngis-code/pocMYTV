import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

import 'clock.dart';

class ScreenSaver extends StatefulWidget {
  const ScreenSaver({super.key});

  @override
  State<ScreenSaver> createState() => _ScreenSaverState();
}

class _ScreenSaverState extends State<ScreenSaver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
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
          const SizedBox(width: 10),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        duration: Duration(seconds: 5),
        primaryColors: const [
          Color(0xFF061556),
          Color(0xFF0073BB),
        ],
        secondaryColors: const [
          Color(0xFF061556),
          Color(0xFF0073BB),
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 120,
                width: 120,
              ),
              const Text(
                "Hello Customer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
