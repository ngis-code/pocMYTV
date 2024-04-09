import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/video_on_demand/movieplay.dart';
import 'package:pocmytv/screens/video_on_demand/video_cards.dart';

class ParallexVideos extends StatefulWidget {
  const ParallexVideos({super.key});

  @override
  State<ParallexVideos> createState() => _ParallexVideosState();
}

class _ParallexVideosState extends State<ParallexVideos> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: .95);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PageView.builder(
        controller: _pageController,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return FocusWidget(
            focusGroup: 'vod',
            focusColor: Colors.transparent,
            hasFocus: index == 0,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MoviePlay(
                  adVideoUrl: 'https://file-examples.com/storage/fe0e2ce82f660c1579f31b4/2017/04/file_example_MP4_1920_18MG.mp4',
                  mainVideoUrl: videos[index],
                );
              }));
            },
            child: Stack(
              children: [
                VideoCards(
                  assetPath: videos[index],
                  isSelected: _selectedIndex == index,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.centerLeft,
                      begin: Alignment.centerRight,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.9),
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ICON',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      Text(
                        'Watch ICON Of the Seas Lanuch to Miami!',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      RatingBarIndicator(
                        rating: 4.5,
                        itemSize: 14,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        onPageChanged: (i) => setState(
          () => _selectedIndex = i,
        ),
      ),
    );
  }
}

final videos = [
  'https://www.shutterstock.com/shutterstock/videos/3392396905/preview/stock-footage-turku-finland-world-s-largest-cruise-ship-icon-of-the-seas-during-second-sea-trials.webm',
  'https://file-examples.com/storage/fef0ba8e7b660ad2093c8cd/2017/04/file_example_MP4_1280_10MG.mp4',
];
