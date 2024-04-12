import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';

class HomeBottomTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final String description;
  final Color color;
  final void Function(bool hasFocus, double height)? onFocusChange;
  final Widget page;
  const HomeBottomTile({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.onFocusChange,
    this.color = Colors.black45,
    required this.page,
  });

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
          width = math.min(math.min(height, width), 200);
          height = 150;
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: FocusWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => widget.page,
                  ),
                );
              },
              onFocusChange: (hasFocus) {
                widget.onFocusChange?.call(hasFocus, height);
              },
              borderRadius: 20,
              backgroundColor: widget.color,
              borderColor: Colors.white,
              borderWidth: 5,
              blur: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: width,
                    height: height / 2.5,
                    child: FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      child: Icon(widget.icon, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: height / 2.5,
                    width: width,
                    child: FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  if (false)
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
