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
                  requestFocus: true,
                  onChannelView: onChannelView,
                  onFocusChange: (index) {
                    log("onFocusChange: $index");
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
    if ((event.logicalKey == LogicalKeyboardKey.arrowLeft ||
            event.logicalKey == LogicalKeyboardKey.backspace ||
            event.logicalKey == LogicalKeyboardKey.goBack ||
            event.logicalKey == LogicalKeyboardKey.escape) &&
        controller.page != 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      return true;
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
        leading: Image.asset(image),
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
          borderRadius: 20,
          child: ListView(
            shrinkWrap: true,
            children: [
              _Tile(
                onFocusReceive: () => onFocusChange(0),
                requestFocus: requestFocus,
                onTap: onChannelView,
                image:
                    "assets/1000_F_277845419_KGENqAUJ1JsiK4e7tNc5N8i1z5fRRwEb.jpg",
                title: "HDMI 1",
                subtitle: "HDMI 1",
              ),
              _Tile(
                onTap: onChannelView,
                image:
                    "assets/images.png",
                title: "Celebrity Entertainment",
                subtitle:
                    "Watch the latest movies and TV shows from Celebrity Entertainment",
              ),
              _Tile(
                onTap: onChannelView,
                image:
                    "assets/1000_F_277845419_KGENqAUJ1JsiK4e7tNc5N8i1z5fRRwEb.jpg",
                title: "Cruise Compass",
                subtitle: "Stay up to date with what's happening on the ship",
              ),
              _Tile(
                onTap: onChannelView,
                image:
                    "assets/map-pointer-art-icons-and-graphics-free-png.webp",
                title: "On The Map",
                subtitle: "Explore the ship and find your way around",
              ),
              _Tile(
                onTap: onChannelView,
                image:
                    "assets/images.png",
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
          borderRadius: 20,
          child: ListView(
            shrinkWrap: true,
            children: [
              _Tile(
                requestFocus: true,
                onTap: onChannelView,
                image:
                    "assets/FOX_wordmark-orange.svg.png",
                title: "FOX",
                subtitle:
                    "Stay informed with the latest celebrity news and gossip from the entertainment industry",
              ),
              _Tile(
                onTap: onChannelView,
                image:
                    "assets/MTV_International_2009.svg.png",
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
