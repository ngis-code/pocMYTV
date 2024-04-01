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
    for (final handler in _handlers) {
      if (handler(event)) return true;
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
}
