import 'package:flutter/material.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
      child: Center(
        child: Text(
          'Coming Soon...',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
