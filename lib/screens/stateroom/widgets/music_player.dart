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
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            right: 0,
            child: Image.network(
              'https://im.rediff.com/getahead/2017/dec/11shape-of-you-cover1.jpg?w=670&h=900',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black26,
                    Colors.black45,
                    Colors.black87,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          GlassWidget(
            padding: const EdgeInsets.all(20.0),
            radius: 20,
            blur: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
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
                  ],
                ),
                FocusWidget(
                  onTap: () {},
                  enabled: false,
                  child: Slider(
                    allowedInteraction: SliderInteraction.tapOnly,
                    value: value,
                    onChanged: (val) {
                      setState(() {
                        value = val;
                      });
                    },
                    activeColor: Colors.blue,
                    inactiveColor: Colors.white54,
                  ),
                ),
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
                      child:
                          const Icon(Icons.skip_previous, color: Colors.white),
                    ),
                    FocusWidget(
                      padding: const EdgeInsets.all(10),
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
          ),
        ],
      ),
    );
  }
}
