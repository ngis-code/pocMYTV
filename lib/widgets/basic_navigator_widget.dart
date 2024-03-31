import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicNavigation extends StatefulWidget {
  final Widget child;
  const BasicNavigation({super.key, required this.child});

  @override
  State<BasicNavigation> createState() => _BasicNavigationState();
}

class _BasicNavigationState extends State<BasicNavigation> {
  bool disposed = false;
  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler(_handleKeyPress);
  }

  @override
  dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKeyPress);
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  bool _handleKeyPress(KeyEvent event) {
    if (disposed || event is KeyDownEvent) return false;
    if (event.logicalKey == LogicalKeyboardKey.escape) {
      disposed = true;
      Navigator.of(context).pop();
    } else {
      log("Logical Key Pressed: ${event.logicalKey}");
      log("Physical Key Pressed: ${event.physicalKey}");
    }
    return true;
  }
}
