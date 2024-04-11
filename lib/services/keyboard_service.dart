import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyBoardService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final _handlers = <bool Function(KeyEvent event)>[];

  static void init() {
    HardwareKeyboard.instance.addHandler(globalKeyPressHandler);
  }

  static bool globalKeyPressHandler(KeyEvent event) {
    if (event is KeyDownEvent) return false;
    for (final handler in _handlers) {
      if (handler(event)) return true;
    }
    switch (event.logicalKey) {
      case LogicalKeyboardKey.escape:
      case LogicalKeyboardKey.backspace:
        if (navigatorKey.currentState!.canPop()) {
          navigatorKey.currentState!.pop();
        }
        break;
      default:
      // log("Logical Key Pressed: ${event.logicalKey}");
      // log("Physical Key Pressed: ${event.physicalKey}");
    }

    /// Special handling for web navigation
    if (kIsWeb) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowUp:
          FocusScope.of(navigatorKey.currentContext!)
              .focusInDirection(TraversalDirection.up);
          break;
        case LogicalKeyboardKey.arrowDown:
          FocusScope.of(navigatorKey.currentContext!)
              .focusInDirection(TraversalDirection.down);
          break;
        case LogicalKeyboardKey.arrowLeft:
          FocusScope.of(navigatorKey.currentContext!)
              .focusInDirection(TraversalDirection.left);
          break;
        case LogicalKeyboardKey.arrowRight:
          FocusScope.of(navigatorKey.currentContext!)
              .focusInDirection(TraversalDirection.right);
          break;
        default:
          log("Logical Key Pressed: ${event.logicalKey}");
          log("Physical Key Pressed: ${event.physicalKey}");
      }
    }
    return true;
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

  static void focusInDirection(
      BuildContext context, TraversalDirection direction) {
    if (!FocusScope.of(context).focusInDirection(direction)) {
      for (final dir in TraversalDirection.values) {
        if (dir != direction && FocusScope.of(context).focusInDirection(dir)) {
          return;
        }
      }
      log("Widget not found to be traversed! for $direction");
    }
  }
}
