import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pocmytv/widgets/focus_widget.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
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
            focusColor: Colors.transparent,
            onTap: () {},
            child: Stack(
              children: [
                VideoCard(
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
                        'Movie',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      Text(
                        'aliquam ad beatae qui quisquam sapiente neque soluta nostrum natus maxime tempora nisi dolore doloribus',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      RatingBarIndicator(
                        rating: 4.2,
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
  'assets/videos/1.mp4',
  'assets/videos/2.mp4',
  'assets/videos/3.mp4',
  'assets/videos/4.mp4',
];

class VideoCard extends StatefulWidget {
  const VideoCard({
    super.key,
    required this.assetPath,
    required this.isSelected,
  });

  final String assetPath;

  final bool isSelected;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  final GlobalKey _videoKey = GlobalKey();

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath);

    _controller
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((_) => setState(() {}))
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Flow(
          delegate: ParallaxFlowDelegate(
            scrollable: Scrollable.of(context),
            listItemContext: context,
            backgroundImageKey: _videoKey,
          ),
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(
                  _controller,
                  key: _videoKey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      height: constraints.maxHeight,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.topCenter(Offset.zero),
      ancestor: scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dx / viewportDimension).clamp(0.0, 1.0);

    // Calculate the horizontal alignment of the background
    // based on the scroll percent.
    final horizontalAlignment = Alignment(scrollFraction * 2 - 1, 0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect = horizontalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(childRect.left, 0)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
