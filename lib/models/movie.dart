import 'package:pocmytv/models/genre.dart';

class Movie {
  String title;
  String description;
  String image;
  Duration duration;
  double? rating;
  Genre genre;
  DateTime createdAt;

  Movie({
    required this.title,
    required this.description,
    required this.image,
    required this.duration,
    this.rating,
    required this.genre,
    required this.createdAt,
  });

  static const List<Movie> allMovies = [];
}
