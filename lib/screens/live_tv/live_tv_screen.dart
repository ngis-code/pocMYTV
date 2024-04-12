import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/services/keyboard_service.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class LiveTvScreen extends StatefulWidget {
  const LiveTvScreen({super.key});

  @override
  State<LiveTvScreen> createState() => _LiveTvScreenState();
}

class _LiveTvScreenState extends State<LiveTvScreen> {
  final controller = PageController();
  bool firstTimeLoaded = true;

  @override
  void initState() {
    super.initState();
    KeyBoardService.addHandler(keyBoardHandler);
  }

  @override
  void dispose() {
    KeyBoardService.removeHandler(keyBoardHandler);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundVideo(
        child: PageView.builder(
          controller: controller,
          allowImplicitScrolling: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => index == 0
              ? Page1(
                  requestFocus: !firstTimeLoaded,
                  onChannelView: onChannelView,
                  onFocusChange: (index) {
                    log("onFocusChange: $index");
                    firstTimeLoaded = false;
                  },
                )
              : Page2(
                  onChannelView: onChannelView,
                ),
          // children: [
          //   Page1(
          //     requestFocus: !firstTimeLoaded,
          //     onChannelView: onChannelView,
          //     onFocusChange: (index) {
          //       log("onFocusChange: $index");
          //       firstTimeLoaded = false;
          //     },
          //   ),
          //   Page2(
          //     onChannelView: onChannelView,
          //   ),
          // ],
        ),
      ),
    );
  }

  onChannelView() {
    controller.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  bool keyBoardHandler(KeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      controller.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      return false;
    }
    return false;
  }
}

class _Tile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final bool requestFocus;
  final Function() onTap;
  final Function()? onFocusReceive;
  const _Tile({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.requestFocus = false,
    this.onFocusReceive,
  });

  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          onFocusReceive?.call();
        }
      },
      hasFocus: requestFocus,
      onTap: onTap,
      focusGroup: "live_tv",
      child: ListTile(
        leading: Image.network(image),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final Function() onChannelView;
  final Function(int index) onFocusChange;
  final bool requestFocus;
  const Page1({
    super.key,
    required this.onChannelView,
    this.requestFocus = true,
    required this.onFocusChange,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GlassWidget(
          backgroundColor: Colors.black26,
          radius: 20,
          child: ListView(
            shrinkWrap: true,
            children: [
              _Tile(
                onFocusReceive: () => onFocusChange(0),
                requestFocus: requestFocus,
                onTap: onChannelView,
                image:
                    "https://i.pinimg.com/originals/17/0a/b5/170ab5775a7c96125e70638942e2f513.png",
                title: "HDMI 1",
                subtitle: "HDMI 1",
              ),
              _Tile(
                onTap: onChannelView,
                image:
                    "https://i.pinimg.com/originals/17/0a/b5/170ab5775a7c96125e70638942e2f513.png",
                title: "Royal Entertainment",
                subtitle:
                    "Watch the latest movies and TV shows from Royal Entertainment",
              ),
              _Tile(
                onTap: onChannelView,
                image:
                    "https://as1.ftcdn.net/v2/jpg/02/77/84/54/1000_F_277845419_KGENqAUJ1JsiK4e7tNc5N8i1z5fRRwEb.jpg",
                title: "Cruise Compass",
                subtitle: "Stay up to date with what's happening on the ship",
              ),
              _Tile(
                onTap: onChannelView,
                image:
                    "https://static.vecteezy.com/system/resources/thumbnails/016/314/482/small/map-pointer-art-icons-and-graphics-free-png.png",
                title: "On The Map",
                subtitle: "Explore the ship and find your way around",
              ),
              _Tile(
                onTap: onChannelView,
                image:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmLxUqyCxVBJlR-nxuMCpe2TT1tF17h_NNCR8cqhpVxw&s",
                title: "Peek-a-boo TV",
                subtitle:
                    "Watch the latest movies and TV shows from Peek a boo TV",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final Function() onChannelView;
  const Page2({super.key, required this.onChannelView});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GlassWidget(
          backgroundColor: Colors.black26,
          radius: 20,
          child: ListView(
            shrinkWrap: true,
            children: [
              _Tile(
                requestFocus: true,
                onTap: onChannelView,
                image:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/FOX_wordmark-orange.svg/1200px-FOX_wordmark-orange.svg.png",
                title: "FOX",
                subtitle:
                    "Stay informed with the latest celebrity news and gossip from the entertainment industry",
              ),
              _Tile(
                onTap: onChannelView,
                image:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/MTV_International_2009.svg/1200px-MTV_International_2009.svg.png",
                title: "MTV",
                subtitle:
                    "MTV is the leading youth entertainment brand for music videos, artist interviews, bingeworthy reality shows, original series and movies, ...",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
