import 'package:flutter/material.dart';
import 'package:pocmytv/screens/stateroom/stateroom_automation.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double value = .3;

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      radius: 20,
      padding: EdgeInsets.all(tilePadding),
      backgroundColor: tileBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shape of You',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          Text(
            'Ed Sheeran',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 10),
          Slider(
            value: value,
            onChanged: (val) {
              setState(() {
                value = val;
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.white54,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shuffle, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_previous, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_next, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.repeat, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
