import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/models/movie/movie.dart';

class MovieTile extends StatefulWidget {
  double height;
  double width;
  final Movie movie;
  MovieTile(
      {super.key,
      required this.movie,
      required this.height,
      required this.width});

  @override
  State<MovieTile> createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  bool hasFocus = false;
  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      focusGroup: 'movieTiles',
      onFocusChange: (hasFocus) {
        setState(() {
          this.hasFocus = hasFocus;
        });
      },
      onTap: () => {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: hasFocus ? widget.height : widget.height - 50,
        width: hasFocus ? widget.width : widget.width - 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(widget.movie.title),
            subtitle: Text(
              widget.movie.description,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
          child: Image.network(
            widget.movie.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
