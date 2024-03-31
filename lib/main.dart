import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocmytv/screens/screensaver.dart';

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
      home: const ScreenSaver(),
    );
  }
}
