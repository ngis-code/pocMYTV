import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';

class RateBar extends StatefulWidget {
  const RateBar({super.key});

  @override
  State<RateBar> createState() => _RateBarState();
}

class _RateBarState extends State<RateBar> {
  double rating = 3;
  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      focusGroup: 'rateBar',
      onTap: () {
        setState(() {
          rating = (rating + 0.5) % 5.5;
        });
      },
      child: RatingBar(
          ratingWidget: RatingWidget(
            full: const Icon(Icons.star, color: Colors.amber),
            half: const Icon(Icons.star_half, color: Colors.amber),
            empty: const Icon(Icons.star_border, color: Colors.amber),
          ),
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 30,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {}),
    );
  }
}
