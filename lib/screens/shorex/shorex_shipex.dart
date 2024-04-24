import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/shorex/matter_port_3d_view.dart';
import 'package:pocmytv/screens/shorex/shorex.dart';

class ShorexShipxScreen extends StatelessWidget {
  const ShorexShipxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BubbleAnimation(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FocusWidget(
              child: const Text('ShoreX'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ShorexScreen(),
                  ),
                );
              },
            ),
            FocusWidget(
              child: const Text('ShipX'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ShipXScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
