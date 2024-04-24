import 'package:flutter/material.dart';
import 'package:pocmytv/globals.dart';
import 'package:pocmytv/models/timelines/timeline.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';

class RoomService extends StatefulWidget {
  const RoomService({super.key});

  @override
  State<RoomService> createState() => _RoomServiceState();
}

class _RoomServiceState extends State<RoomService> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BackgroundVideo(
        backgroundWidget: Container(),
        child: BubbleAnimation(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(),
          ),
        ),
      ),
    );
  }
}
