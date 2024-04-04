import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
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
    return PageView(
      controller: controller,
      allowImplicitScrolling: false,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GlassWidget(
              backgroundColor: Colors.black26,
              radius: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Tile(
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
                    subtitle:
                        "Stay up to date with what's happening on the ship",
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
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GlassWidget(
              backgroundColor: Colors.black26,
              radius: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Tile(
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
        ),
      ],
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
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
        event.logicalKey == LogicalKeyboardKey.backspace ||
        event.logicalKey == LogicalKeyboardKey.escape) {
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
  final Function() onTap;
  _Tile({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      focusNode: focusNode,
      onTap: () {
        focusNode.unfocus();
        onTap();
      },
      child: ListTile(
        leading: Image.network(image),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
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
