import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocmytv/screens/screensaver/screensaver.dart';
import 'package:pocmytv/services/keyboard_service.dart';

import 'widgets/bezierpainter.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    KeyBoardService.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: KeyBoardService.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'TV',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: const ScreenSaver(),
      // home: ProcessTimelinePage(),
    );
  }
}
