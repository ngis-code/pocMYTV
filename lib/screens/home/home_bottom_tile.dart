import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';

class HomeBottomTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final String description;
  final Function() onTap;
  final void Function(bool hasFocus, double height)? onFocusChange;
  const HomeBottomTile(
      {super.key,
      required this.title,
      required this.description,
      required this.onTap,
      required this.icon,
      this.onFocusChange});

  @override
  State<HomeBottomTile> createState() => _HomeBottomTileState();
}

class _HomeBottomTileState extends State<HomeBottomTile> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;
          width = math.min(height, width);
          height = width;
          return Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: FocusWidget(
              onTap: widget.onTap,
              onFocusChange: (hasFocus) {
                widget.onFocusChange?.call(hasFocus, height);
              },
              borderRadius: 20,
              backgroundColor: Colors.black.withOpacity(0.5),
              borderColor: Colors.white,
              borderWidth: 5,
              blur: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: width,
                    height: height * 0.5,
                    child: FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      child: Icon(widget.icon, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.25,
                    width: width,
                    child: FittedBox(
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.25,
                    width: width,
                    child: Text(
                      widget.description,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.white.withOpacity(0.7),
                          ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
