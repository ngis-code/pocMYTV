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
  double padding = 20;
  double height = 200;
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 240,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: FocusWidget(
            onTap: () {},
            borderColor: Colors.transparent,
            onFocusChange: (hasFocus) {
              setState(() {
                padding = hasFocus ? 0 : 20;
                height = hasFocus ? 240 : 200;
                color = hasFocus
                    ? Colors.white.withOpacity(.1)
                    : Colors.transparent;
              });
            },
            child: AnimatedContainer(
              height: height,
              width: height,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: color,
                  width: 2,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                widget.genre.name.split('.').last.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
