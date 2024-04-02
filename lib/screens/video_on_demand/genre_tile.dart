import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/models/movie/genre.dart';

import '../../widgets/parallax_effect_screen.dart';

class GenreTile extends StatefulWidget {
  final Genre genre;
  final void Function(bool hasFocus)? onFocusChange;
  const GenreTile({
    super.key,
    required this.genre,
    this.onFocusChange,
  });

  @override
  State<GenreTile> createState() => _GenreTileState();
}

class _GenreTileState extends State<GenreTile> {
  static const double maxHeight = 240;
  static const double maxPadding = 20;
  bool hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxHeight,
      height: maxHeight,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(hasFocus ? 0 : maxPadding),
          child: FocusWidget(
            focusGroup: 'genreTiles',
            backgroundColor: Colors.grey.withOpacity(.2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ParallaxEffectScreen();
                  },
                ),
              );
            },
            onFocusChange: (hasFocus) {
              setState(() {
                this.hasFocus = hasFocus;
              });
              widget.onFocusChange?.call(hasFocus);
            },
            child: AnimatedContainer(
              height: hasFocus ? maxHeight : maxHeight - maxPadding * 2,
              width: hasFocus ? maxHeight : maxHeight - maxPadding * 2,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.transparent,
                  // width: 2,
                ),
                image: DecorationImage(
                  image: NetworkImage(genreImages[widget.genre]!),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                  Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: Text(
                        widget.genre.name.split('.').last.toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              fontSize: hasFocus ? 30 : 20,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
