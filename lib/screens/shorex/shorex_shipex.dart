import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/screens/shorex/matter_port_3d_view.dart';
import 'package:pocmytv/screens/shorex/shorex.dart';

class ShorexShipxScreen extends StatelessWidget {
  const ShorexShipxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BubbleAnimation(
      child: BackgroundVideo(
        backgroundWidget: Container(),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FocusWidget(
                hasFocus: true,
                focusGroup: "shorexBttns",
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://www.beverlyhillsmagazine.com/wp-content/uploads/Beverly-Hills-Magazine-Celebrity-Cruises-Best-of-Greece-1-1600x755.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 700,
                  width: 400,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Shore Explore',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://hommes.studio/wp-content/uploads/celebritybeyond-2.jpg.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 700,
                  width: 400,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Ship Explore',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}
