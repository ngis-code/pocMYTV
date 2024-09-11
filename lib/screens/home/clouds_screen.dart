import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pocmytv/screens/home/cloud.dart';
import 'package:vector_math/vector_math_64.dart' as v;

const List<String> cloudImages = [
  'assets/pngimg.com - cloud_PNG6.png',
  'assets/Cloud_H03_2k (1).webp',
  'assets/Sky-PNG-Free-Image.png',
  'assets/pngimg.com - cloud_PNG8.png',
];
const bool showClouds = true;
const Duration cloudSummonDelay = Duration(seconds: 7);
const double cloudHeight = 800.0;
const double cloudWidth = 800.0;
const double maxVelocity = 1;
const double minVelocity = 0.5;
const double cloudOpacity = 0.3;
const int cloudsAnimationFps = 30; // reducing this also slows the clouds down

class CloudsScreen extends StatefulWidget {
  const CloudsScreen({super.key});

  @override
  State<CloudsScreen> createState() => _CloudsScreenState();
}

class _CloudsScreenState extends State<CloudsScreen> {
  final List<Cloud> clouds = [];
  late final Timer timer;
  late final Timer moveTimer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(cloudSummonDelay, (timer) {
      final cloud = Cloud(
        imageUrl: cloudImages[clouds.length % cloudImages.length],
        position: v.Vector2(
          math.Random().nextDouble() * MediaQuery.of(context).size.width,
          -cloudHeight,
        ),
        velocity: v.Vector2(
            0,
            math.Random().nextDouble() * (maxVelocity - minVelocity) +
                minVelocity),
      );
      setState(() {
        clouds.add(cloud);
      });
    });
    _moveClouds();
  }

  @override
  void dispose() {
    timer.cancel();
    moveTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (final cloud in clouds)
          Positioned(
            left: cloud.position.x,
            top: cloud.position.y,
            child: Image.asset(
              cloud.imageUrl,
              width: cloudWidth,
              height: cloudHeight,
              color: Colors.white.withOpacity(cloudOpacity),
            ),
          ),
      ],
    );
  }

  void _moveClouds() {
    moveTimer = Timer.periodic(
        const Duration(milliseconds: 1000 ~/ cloudsAnimationFps), (timer) {
      final List<Cloud> cloudsToRemove = [];
      setState(() {
        for (final cloud in clouds) {
          cloud.position.add(cloud.velocity);
          if (cloud.position.y > MediaQuery.of(context).size.height) {
            cloudsToRemove.add(cloud);
          }
        }
        clouds.removeWhere((element) => cloudsToRemove.contains(element));
      });
    });
  }
}
