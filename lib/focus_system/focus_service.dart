import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_group.dart';

class FocusService {
  static final Map<String, FocusGroup> _focusGroups = {};
  static String? _lastFocusedGroup;

  static void add(String group, FocusNode focusNode) {
    // log('Adding FocusNode to group $group', name: 'FocusService.add');
    if (!_focusGroups.containsKey(group)) {
      _focusGroups[group] = FocusGroup();
    }
    _focusGroups[group]!.add(focusNode);
  }

  static void remove(String group, FocusNode focusNode) {
    // log('Removing FocusNode from group $group', name: 'FocusService.remove');
    if (_focusGroups.containsKey(group)) {
      _focusGroups[group]!.remove(focusNode);
    } else {
      // log('FocusGroup $group not found', name: 'FocusService.remove');
    }
  }

  static bool requestFocus(String group, FocusNode focusNode) {
    // log('Requesting FocusNode in group $group',
    // name: 'FocusService.requestFocus')
    if (_lastFocusedGroup != group) {
      // log("Focus was changed to from group: $_lastFocusedGroup to group: $group",
      // name: "FocusService.requestFocus")
      _lastFocusedGroup = group;
      _focusGroups[group]?.focus();
      return _focusGroups[group]?.lastFocusedNode == focusNode;
    }
    // log("Focus was not changed", name: "FocusService.requestFocus");
    _focusGroups[group]?.focusNode(focusNode);
    return true;
  }
}
