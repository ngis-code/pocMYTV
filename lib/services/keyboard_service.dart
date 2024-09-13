import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyBoardService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final _handlers = <bool Function(KeyEvent event)>[];

  static bool hasFocus = false;

  static void init() {
    HardwareKeyboard.instance.addHandler(globalKeyPressHandler);
  }

  static bool globalKeyPressHandler(KeyEvent event) {
    if (event is KeyDownEvent) return false;
    if (event.physicalKey.usbHidUsage == 98784247808 ||
        event.logicalKey.keyId == 4294967297 || event.logicalKey.keyId == 461) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text('Back Button Found!'),
        ),
      );
      if (navigatorKey.currentState!.canPop()) {
        navigatorKey.currentState!.pop();
      }
      return true;
    }
    ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
    // show a snackbar with the id
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(
            'logicalKey.keyId: ${event.logicalKey.keyId}, \n physicalKey.usbHidUsage: ${event.physicalKey.usbHidUsage}\nevent.character: ${event.character}\n '),
      ),
    );
    for (final handler in _handlers) {
      if (handler(event)) return true;
    }
    log("global manager called");

    switch (event.logicalKey) {
      case LogicalKeyboardKey.escape:
      case LogicalKeyboardKey.backspace:
      case LogicalKeyboardKey.goBack:
        if (navigatorKey.currentState!.canPop()) {
          navigatorKey.currentState!.pop();
        }
        break;
      case LogicalKeyboardKey.arrowLeft:
      case LogicalKeyboardKey.arrowRight:
      case LogicalKeyboardKey.arrowUp:
      case LogicalKeyboardKey.arrowDown:
        if (!hasFocus) {
          FocusScope.of(navigatorKey.currentContext!).nextFocus();
        }
        break;
      default:
        log(event.logicalKey.keyLabel);
    }
    return true;
  }

  static void nextFocus() {
    FocusScope.of(navigatorKey.currentContext!).nextFocus();
  }

  static void unfocus() {
    FocusScope.of(navigatorKey.currentContext!).unfocus();
  }

  static void addHandler(bool Function(KeyEvent event) handler) {
    _handlers.add(handler);
  }

  static void removeHandler(bool Function(KeyEvent event) handler) {
    _handlers.remove(handler);
  }

  static bool focusInDirection(
      FocusNode focusNode, TraversalDirection direction) {
    final moved = focusNode.focusInDirection(direction);
    if (!moved) {
      focusNode.requestFocus();
      return false;
    }
    return true;
  }
}
