import 'package:flutter/material.dart';
import 'package:pocmytv/screensaver.dart';

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
      ),
      // home: const HomePage(),
      // home: const ScreenSaver(),
      home: const BubbleAnimation(),
    );
  }
}
