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
    (lastFocusedNode ?? focusNodes.firstOrNull)?.requestFocus();
  }

  void focusNode(FocusNode focusNode) {
    if (!focusNodes.contains(focusNode)) {
      log('FocusNode $focusNode not found', name: 'FocusGroup.focusNode');
      return;
    }
    lastFocusedNode = focusNode;
    focusNode.requestFocus();
  }
}
