import 'package:flutter/material.dart';
import 'package:pocmytv/screens/video_on_demand/parallax_flow_delegate.dart';
import 'package:video_player/video_player.dart';

class VideoCards extends StatefulWidget {
  const VideoCards({
    super.key,
    required this.assetPath,
    required this.isSelected,
  });

  final String assetPath;

  final bool isSelected;

  @override
  State<VideoCards> createState() => _VideoCardsState();
}

class _VideoCardsState extends State<VideoCards> {
  final GlobalKey _videoKey = GlobalKey();

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.assetPath,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

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
