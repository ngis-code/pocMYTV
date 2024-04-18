import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../focus_system/focus_widget.dart';
import '../../utils/glass_widget.dart';
import '../../widgets/clock.dart';

class AdvertisementScreen extends StatefulWidget {
  final String adUrl;
  final Function? onAdEnd;
  const AdvertisementScreen({super.key, required this.adUrl, this.onAdEnd});

  @override
  State<AdvertisementScreen> createState() => _AdvertisementScreenState();
}

class _AdvertisementScreenState extends State<AdvertisementScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.adUrl,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      })
      ..addListener(() {
        if (_controller.value.position >= _controller.value.duration) {
          widget.onAdEnd?.call();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

double height = MediaQuery.of(context).size.height;
double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AspectRatio(
                    aspectRatio: width / height,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
      floatingActionButton: FocusWidget(
              onTap: (){
                widget.onAdEnd?.call();
              },
              borderColor: Colors.white,
              backgroundColor: Colors.black45,
              padding: const EdgeInsets.all(8),
              child: ClockWidget(
                updatePerSec: true,
                builder: (context, time) {
                  final timeToFinish =
                      const Duration(seconds: 5) - _controller.value.position;
                  if (_controller.value.position >=
                      const Duration(seconds: 5)) {
                    return const Icon(
                      Icons.skip_next_rounded,
                      color: Colors.white,
                    );
                  }
                  return GlassWidget(
                    radius: 50,
                    backgroundColor: Colors.black45,
                    blur: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      "${timeToFinish.inMinutes}:${timeToFinish.inSeconds % 60}",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
