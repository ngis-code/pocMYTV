import 'package:flutter/material.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/widgets/drawer_row.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BubbleAnimation(
      colors: const [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow,
        Colors.purple,
      ],
      child: DrawerRow(
        focusedItem: 4,
        child: Center(
          child: Text(
            'Coming Soon...',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
