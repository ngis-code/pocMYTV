import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pocmytv/screens/home/cloud.dart';
import 'package:vector_math/vector_math_64.dart' as v;

// Summons random clouds with random velocities (all velocities are directed down) and random positions (start position will have y=0, but can have any x value (0 to width))
class CloudsScreen extends StatefulWidget {
  static const List<String> cloudImages = [
    'https://freepngtransparent.com/wp-content/uploads/2023/03/cloud-png-166.png',
    'https://cdn.pixabay.com/photo/2013/07/13/12/12/cloud-159388_640.png',
    'https://pngimg.com/d/cloud_PNG6.png',
  ];
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
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      final cloud = Cloud(
        imageUrl: CloudsScreen
            .cloudImages[clouds.length % CloudsScreen.cloudImages.length],
        position: v.Vector2(
          math.Random().nextDouble() * MediaQuery.of(context).size.width,
          -400,
        ),
        velocity: v.Vector2(0, math.Random().nextDouble() * 0.5 + 1),
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
            child: Image.network(
              cloud.imageUrl,
              width: 400,
              height: 400,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
      ],
    );
  }

  void _moveClouds() {
    const int fps = 30;
    moveTimer =
        Timer.periodic(const Duration(milliseconds: 1000 ~/ fps), (timer) {
      final List<Cloud> cloudsToRemove = [];
      setState(() {
        for (final cloud in clouds) {
          cloud.position.add(cloud.velocity);
          if (cloud.position.y > MediaQuery.of(context).size.height) {
            // clouds.remove(cloud);
            cloudsToRemove.add(cloud);
          }
        }
        clouds.removeWhere((element) => cloudsToRemove.contains(element));
      });
    });
  }
}
