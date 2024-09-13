import 'package:flutter/material.dart';
import 'package:pocmytv/services/keyboard_service.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

BuildContext get appContext {
  if (KeyBoardService.navigatorKey.currentContext == null) {
    throw 'Navigator key is not initialized';
  }
  return KeyBoardService.navigatorKey.currentContext!;
}
