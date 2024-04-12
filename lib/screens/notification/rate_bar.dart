import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';

class RateBar extends StatefulWidget {
  final double minRating;
  final double maxRating;
  final double initialRating;
  final double size;
  final void Function(double rating)? onRatingUpdate;
  const RateBar({
    super.key,
    this.minRating = 0,
    this.maxRating = 5,
    this.initialRating = 1,
    this.onRatingUpdate,
    this.size = 30,
  });

  @override
  State<RateBar> createState() => _RateBarState();
}

class _RateBarState extends State<RateBar> {
  late double rating;

  @override
  void initState() {
    super.initState();
    rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    final child = RatingBar(
      ratingWidget: RatingWidget(
        full: const Icon(Icons.star, color: Colors.amber),
        half: const Icon(Icons.star_half, color: Colors.amber),
        empty: const Icon(Icons.star_border, color: Colors.amber),
      ),
      initialRating: rating,
      minRating: widget.minRating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: widget.maxRating.toInt(),
      itemSize: widget.size,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: widget.onRatingUpdate ?? (rating) {},
    );
    if (widget.onRatingUpdate == null) return child;
    return FocusWidget(
      focusGroup: 'rateBar',
      onTap: () {
        setState(() {
          rating = (rating + 0.5) % (widget.maxRating + 0.5);
          if (rating < widget.minRating) rating = widget.minRating;
        });
      },
      child: child,
    );
  }
}
