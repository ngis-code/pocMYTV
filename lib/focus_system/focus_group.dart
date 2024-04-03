import 'dart:developer';

import 'package:flutter/material.dart';

class FocusGroup {
  final Set<FocusNode> focusNodes = {};
  FocusNode? lastFocusedNode;

  void add(FocusNode focusNode) {
    focusNodes.add(focusNode);
  }

  void remove(FocusNode focusNode) {
    if (lastFocusedNode == focusNode) {
      lastFocusedNode = null;
    }
    focusNodes.remove(focusNode);
  }

  bool? focus() {
    final node = (lastFocusedNode ?? focusNodes.firstOrNull);
    if (node?.hasFocus == true) return true;
    log("Focus wasn't on the last focused node", name: 'FocusGroup.focus');
    Future.delayed(const Duration(milliseconds: 1), () => node?.requestFocus());
    // node?.requestFocus();
    return node?.hasFocus;
  }

  void focusNode(FocusNode focusNode) {
    if (!focusNodes.contains(focusNode)) {
      log('FocusNode $focusNode not found', name: 'FocusGroup.focusNode');
      return;
    }
    lastFocusedNode = focusNode;
    if (focusNode.hasFocus) return;
    Future.delayed(
        const Duration(milliseconds: 1), () => focusNode.requestFocus());
    // focusNode.requestFocus();
  }
}
