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
              hasFocus: true,
              focusGroup: "shorexBttns",
              child: Text(
                'ShoreX',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ShorexScreen(),
                  ),
                );
              },
            ),
            FocusWidget(
              focusGroup: "shorexBttns",
              child: Text(
                'ShipX',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
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
