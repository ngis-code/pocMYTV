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

  void focus() {
    final node = (lastFocusedNode ?? focusNodes.firstOrNull);
    if (node?.hasFocus == true) return;
    log("Focus wasn't on the last focused node", name: 'FocusGroup.focus');
    node?.requestFocus();
  }

  void focusNode(FocusNode focusNode) {
    if (!focusNodes.contains(focusNode)) {
      log('FocusNode $focusNode not found', name: 'FocusGroup.focusNode');
      return;
    }
    lastFocusedNode = focusNode;
    if (focusNode.hasFocus) return;
    focusNode.requestFocus();
  }
}
