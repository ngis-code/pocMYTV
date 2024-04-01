import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyBoardService {
  static final instance = KeyBoardService._();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  KeyBoardService._() {
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
        log("Logical Key Pressed: ${event.logicalKey}");
        log("Physical Key Pressed: ${event.physicalKey}");
    }
    return false;
  }

  static void unfocus() {
    FocusScope.of(navigatorKey.currentContext!).unfocus();
  }

  static void addHandler(bool Function(KeyEvent event) handler) {
    HardwareKeyboard.instance.addHandler(handler);
  }

  static void removeHandler(bool Function(KeyEvent event) handler) {
    HardwareKeyboard.instance.removeHandler(handler);
  }
}
