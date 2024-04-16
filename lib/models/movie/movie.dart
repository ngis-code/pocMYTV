import 'package:pocmytv/models/movie/genre.dart';

class Movie {
  String title;
  String description;
  String image;
  Duration duration;
  double? rating;
  List<Genre> genre;
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

  static List<Movie> allMovies = [
    // game of thrones
    Movie(
      title: 'CocoCay Island',
      description: 'your details here',
      image:
          'https://www.cruisehive.com/wp-content/uploads/2023/12/cococay1.jpg',
      duration: const Duration(hours: 1, minutes: 5),
      rating: 9.3,
      genre: [Genre.action, Genre.drama],
      createdAt: DateTime(2021, 10, 2),
    ),
    // the boss baby
    Movie(
      title: 'CocoCay Island',
      description: 'your details here',
      image:
          'https://www.cruisehive.com/wp-content/uploads/2023/12/cococay1.jpg',
      duration: const Duration(hours: 1, minutes: 37),
      rating: 6.3,
      genre: [Genre.comedy],
      createdAt: DateTime(2021, 10, 3),
    ),
    // cars
    // Movie(
    //   title: 'Cars',
    //   description:
    //       'Cars is a 2006 American computer-animated comedy film produced by Pixar Animation Studios and released by Walt Disney Pictures.',
    //   image: 'assets/images/3.jpg',
    //   duration: const Duration(hours: 1, minutes: 57),
    //   rating: 7.1,
    //   genre: [Genre.comedy],
    //   createdAt: DateTime(2021, 10, 4),
    // ),
    // // bolt
    // Movie(
    //   title: 'Bolt',
    //   description:
    //       'Bolt is a 2008 American computer-animated comedy-adventure film produced by Walt Disney Animation Studios and released by Walt Disney Pictures.',
    //   image: 'assets/images/4.jpg',
    //   duration: const Duration(hours: 1, minutes: 36),
    //   rating: 6.8,
    //   genre: [Genre.comedy],
    //   createdAt: DateTime(2021, 10, 5),
    // ),
  ];
}
