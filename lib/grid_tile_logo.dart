import 'package:flutter/material.dart';
import 'package:pocmytv/extensions/string_extensions.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';

class GridTileLogo extends StatelessWidget {
  final String title;
  final Widget icon;
  final Color color;
  final void Function()? onTap;
  final bool hasFocus;
  const GridTileLogo({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
    this.hasFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: title.replaceAll('_', ' '),
      child: Material(
        elevation: 0,
        color: Colors.transparent,
        child: FocusWidget(
          hasFocus: hasFocus,
          onTap: onTap ?? () {},
          enabled: onTap != null,
          borderRadius: 16,
          backgroundColor: color.withOpacity(0.2),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              Expanded(
                child: Center(
                  child: Text(
                    title.replaceAll('_', ' ').toPascalCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
