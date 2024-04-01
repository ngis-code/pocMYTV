import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_group.dart';

class FocusService {
  static final Map<String, FocusGroup> _focusGroups = {};
  static String? _lastFocusedGroup;

  static void add(String group, FocusNode focusNode) {
    if (!_focusGroups.containsKey(group)) {
      _focusGroups[group] = FocusGroup();
    }
    _focusGroups[group]!.add(focusNode);
  }

  static void remove(String group, FocusNode focusNode) {
    if (_focusGroups.containsKey(group)) {
      _focusGroups[group]!.remove(focusNode);
    } else {
      log('FocusGroup $group not found', name: 'FocusService.remove');
    }
  }

  static bool requestFocus(String group, FocusNode focusNode) {
    if (_lastFocusedGroup != group) {
      _lastFocusedGroup = group;
      _focusGroups[group]?.focus();
      return _focusGroups[group]?.lastFocusedNode == focusNode;
    }
    _focusGroups[group]?.focusNode(focusNode);
    return true;
  }
}
