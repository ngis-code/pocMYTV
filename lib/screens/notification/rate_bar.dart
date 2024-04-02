import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';

class RateBar extends StatefulWidget {
  final double minRating;
  final double maxRating;
  final double initialRating;
  const RateBar({
    super.key,
    this.minRating = 0,
    this.maxRating = 5,
    this.initialRating = 1,
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
    return FocusWidget(
      focusGroup: 'rateBar',
      onTap: () {
        setState(() {
          rating = (rating + 0.5) % (widget.maxRating + 0.5);
          if (rating < widget.minRating) rating = widget.minRating;
        });
      },
      child: RatingBar(
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
        itemSize: 30,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        onRatingUpdate: (rating) {},
      ),
    );
  }
}
