import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/models/movie/genre.dart';

import 'video_screen.dart';

class GenreTile extends StatefulWidget {
  final Genre genre;
  final bool hasFocus;
  final void Function(bool hasFocus)? onFocusChange;
  const GenreTile({
    super.key,
    required this.genre,
    this.onFocusChange,
    required this.hasFocus,
  });

  @override
  State<GenreTile> createState() => _GenreTileState();
}

class _GenreTileState extends State<GenreTile> {
  static const double maxHeight = 200;
  static const double maxPadding = 10;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    hasFocus = widget.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxHeight,
      height: maxHeight,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(hasFocus ? 0 : maxPadding),
          child: FocusWidget(
            hasFocus: hasFocus,
            focusGroup: 'genreTiles',
            backgroundColor: Colors.grey.withOpacity(.2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const VideoScreen();
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
              clipBehavior: Clip.antiAlias,
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
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image.network(
                    genreImages[widget.genre]!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
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
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
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
