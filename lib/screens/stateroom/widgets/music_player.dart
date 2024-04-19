import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
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
      child: Stack(
        children: [
          Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Image.network(
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fm.rediff.com%2Fgetahead%2Freport%2Ftrend-shape-of-you-ed-sheeran-drake-despacito-most-streamed-spotify-apple-music-youtube%2F20171211.htm&psig=AOvVaw2Bk7FIaLLMd72GPlmFKf6Z&ust=1713634496477000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPDLw43ozoUDFQAAAAAdAAAAABAZ')),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          Column(
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
                  FocusWidget(
                    padding: const EdgeInsets.all(10),
                    onTap: () {},
                    child: const Icon(Icons.shuffle, color: Colors.white),
                  ),
                  FocusWidget(
                    padding: const EdgeInsets.all(10),
                    onTap: () {},
                    child: const Icon(Icons.skip_previous, color: Colors.white),
                  ),
                  FocusWidget(
                    padding: const EdgeInsets.all(10),
                    hasFocus: true,
                    onTap: () {},
                    child: const Icon(Icons.play_arrow, color: Colors.white),
                  ),
                  FocusWidget(
                    padding: const EdgeInsets.all(10),
                    onTap: () {},
                    child: const Icon(Icons.skip_next, color: Colors.white),
                  ),
                  FocusWidget(
                    padding: const EdgeInsets.all(10),
                    onTap: () {},
                    child: const Icon(Icons.repeat, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
