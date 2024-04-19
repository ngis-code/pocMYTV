import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/stateroom/stateroom_automation.dart';
import 'package:pocmytv/utils/shader_widget.dart';

class StateroomThemeTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool chosen;
  final Function() onTap;
  const StateroomThemeTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.chosen,
  });

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(
      icon,
      color: Colors.white,
      size: 30,
    );
    Widget textWidget = Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
    );
    if (chosen) {
      iconWidget = ShaderWidget(
        colors: const [
          Colors.tealAccent,
          // Colors.cyanAccent,
          Colors.blueAccent,
        ],
        child: iconWidget,
      );
      textWidget = ShaderWidget(
        colors: const [
          Colors.tealAccent,
          // Colors.cyanAccent,
          Colors.blueAccent,
        ],
        child: textWidget,
      );
    }
    return FocusWidget(
      onTap: onTap,
      padding: EdgeInsets.all(tilePadding),
      backgroundColor: tileBackgroundColor,
      borderRadius: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: iconWidget,
            ),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: textWidget,
            ),
          ),
        ],
      ),
    );
  }
}
