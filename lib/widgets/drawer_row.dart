import 'package:flutter/material.dart';
import 'package:pocmytv/widgets/drawer.dart';

class DrawerRow extends StatelessWidget {
  final int focusedItem;
  final Widget child;
  const DrawerRow({
    super.key,
    required this.focusedItem,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TVDrawer(focusedItem: focusedItem),
        Expanded(child: child),
      ],
    );
  }
}
