import 'package:flutter/material.dart';
import 'package:pocmytv/models/genre.dart';
import 'package:pocmytv/widgets/focus_widget.dart';

class GenreTile extends StatefulWidget {
  final Genre genre;
  const GenreTile({super.key, required this.genre});

  @override
  State<GenreTile> createState() => _GenreTileState();
}

class _GenreTileState extends State<GenreTile> {
  static const double maxHeight = 240;
  static const double maxPadding = 20;
  double padding = maxPadding;
  double height = maxHeight - 2 * maxPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxHeight,
      height: maxHeight,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: FocusWidget(
            onTap: () {},
            borderColor: Colors.white30,
            onFocusChange: (hasFocus) {
              setState(() {
                padding = hasFocus ? 0 : maxPadding;
                height = hasFocus ? maxHeight : maxHeight - 2 * maxPadding;
              });
            },
            child: AnimatedContainer(
              height: height,
              width: height,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                widget.genre.name.split('.').last.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
