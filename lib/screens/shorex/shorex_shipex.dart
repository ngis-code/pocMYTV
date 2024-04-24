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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/2fcfb85b-6f9b-4271-b7b9-68a2ef424a38/Frame+460785.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 200,
                  width: 200,
                  child: Text(
                    'ShoreX',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/2fcfb85b-6f9b-4271-b7b9-68a2ef424a38/Frame+460785.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 200,
                  width: 200,
                  child: Text(
                    'ShipX',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
