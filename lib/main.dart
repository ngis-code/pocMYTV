import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/bubble.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TV',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      // home: const HomePage(),
      // home: const ScreenSaver(),
      home: BubbleAnimation(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 120,
              width: 120,
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
                    text: 'Icon of the seas',
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
            const Text(
              "Press any key to continue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
