import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/services/keyboard_service.dart';

class PhotoViewScreen extends StatefulWidget {
  final dynamic data;
  const PhotoViewScreen({super.key, required this.data});

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  final controller = TransformationController();

  @override
  void initState() {
    super.initState();
    KeyBoardService.addHandler(_handler);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BubbleAnimation(
      child: BackgroundVideo(
        backgroundWidget: Container(),
        child: InteractiveViewer(
          transformationController: controller,
          child: FocusWidget(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            borderRadius: 0,
            borderColor: Colors.transparent,
            borderWidth: 0,
            onTap: () {
              // zoom if not zoomed
              if (controller.value.getMaxScaleOnAxis() == 1) {
                controller.value = Matrix4.identity()..scale(2.0, 2.0, 1.0);
              } else {
                controller.value = Matrix4.identity();
              }
            },
            focusGroup: 'photo_view',
            hasFocus: true,
            child: Hero(
              tag: widget.data['image'],
              child: Image.network(
                widget.data['image'],
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _handler(KeyEvent event) {
    if (event is KeyDownEvent) return false;
    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowLeft:
        controller.value.translate(100, 0);
        break;
      case LogicalKeyboardKey.arrowRight:
        controller.value.translate(-100, 0);
        break;
      // case LogicalKeyboardKey.arrowUp:
      //   controller.value.translate(0, 100);
      //   break;
      // case LogicalKeyboardKey.arrowDown:
      //   controller.value.translate(0, -100);
      //   break;
      default:
        return false;
    }
    log("Moved");
    return true;
  }
}
