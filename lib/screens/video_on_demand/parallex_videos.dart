import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/video_on_demand/ad_screen.dart';
import 'package:pocmytv/screens/video_on_demand/black_screen.dart';
import 'package:pocmytv/screens/video_on_demand/movie_play.dart';
import 'package:pocmytv/screens/video_on_demand/video_cards.dart';
import 'package:pocmytv/services/keyboard_service.dart';

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
            onTap: () async {
              final globalContext =
                  KeyBoardService.navigatorKey.currentContext!;
              await Navigator.push(
                globalContext,
                MaterialPageRoute(
                  builder: (context) {
                    // return MoviePlay(
                    //   adVideoUrl: 'https://mytvpocroyal.com/uploads/CELAdds.mp4',
                    //   mainVideoUrl: videos[index],
                    // );
                    return const AdvertisementScreen(
                      adUrl: 'https://mytvpocroyal.com/uploads/CELAdds.mp4',
                    );
                  },
                ),
              );
              await Navigator.push(
                globalContext,
                MaterialPageRoute(
                  builder: (context) {
                    return const BlackScreen();
                  },
                ),
              );
              await Navigator.push(
                globalContext,
                MaterialPageRoute(
                  builder: (context) {
                    return MoviePlayyy(movieUrl: videos[index]);
                  },
                ),
              );
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
                        'TOP GUN',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      Text(
                        'Watch this demo movie with adds integrated',
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
  'https://mytvpocroyal.com/uploads/topgunmovie.mp4',
  'https://mytvpocroyal.com/uploads/topgunmovie.mp4',
];
