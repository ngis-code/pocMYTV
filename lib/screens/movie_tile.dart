import 'package:flutter/material.dart';
import 'package:pocmytv/models/movie.dart';
import 'package:pocmytv/widgets/focus_widget.dart';

class MovieTile extends StatefulWidget {
  final Movie movie;
  const MovieTile({super.key, required this.movie});

  @override
  State<MovieTile> createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  bool hasFocus = false;
  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      onTap: () {
        setState(() {
          hasFocus = !hasFocus;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: hasFocus ? Matrix4.identity() : Matrix4.identity()
          ..scale(0.9),
        height: hasFocus ? 300 : 200,
        width: hasFocus ? 200 : 150,
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
          child: Image.asset(
            widget.movie.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
