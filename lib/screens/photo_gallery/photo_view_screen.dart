import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/models/photo/photo.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/services/keyboard_service.dart';

class PhotoViewScreen extends StatefulWidget {
  final void Function(bool liked)? onPhotoLiked;
  final Photo photo;

  const PhotoViewScreen({
    super.key,
    required this.photo,
    this.onPhotoLiked,
  });

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  late bool liked = widget.photo.liked;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 100))
          .then((value) => KeyBoardService.addHandler(_handler));
    });
  }

  @override
  void dispose() {
    KeyBoardService.removeHandler(_handler);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BubbleAnimation(
      child: BackgroundVideo(
        backgroundWidget: Container(),
        child: Stack(
          children: [
            Center(
              child: Stack(
                children: [
                  InteractiveViewer(
                    child: Hero(
                      tag: widget.photo.url,
                      child: Material(
                        elevation: 0,
                        color: Colors.transparent,
                        child: Image.asset(
                          widget.photo.url,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: likePhoto,
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 5,
                          top: 8,
                          right: 5,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          liked
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: liked ? Colors.red : Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: Icon(
                  Icons.arrow_right_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Center(
                child: FocusWidget(
                  onTap: () {
                    likePhoto();
                  },
                  blur: 5,
                  enabled: false,
                  borderRadius: 20,
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.black38,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Press enter if you wnat to add this photo to your favorites list. You can purchase the photo later.',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Yes',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'No',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _handler(KeyEvent event) {
    if (event is KeyDownEvent) return false;
    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowLeft:
        // controller.value.translate(100, 0);
        break;
      case LogicalKeyboardKey.arrowRight:
        // controller.value.translate(-100, 0);
        break;
      case LogicalKeyboardKey.enter:
        likePhoto();
      default:
        return false;
    }
    log("Moved");
    return true;
  }

  void likePhoto() {
    setState(() {
      liked = !liked;
      widget.onPhotoLiked?.call(liked);
    });
  }
}
