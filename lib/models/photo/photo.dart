class Photo {
  String url;
  bool liked;
  double price;

  Photo({
    required this.url,
    this.liked = false,
    this.price = 0.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'liked': liked,
      'price': price,
    };
  }

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      url: json['url'],
      liked: json['liked'],
      price: json['price'],
    );
  }

  static List<Photo> allPhotos = [
    Photo(
      price: 29.99,
      url: 'assets/DSC_3234_ES1V.jpeg',
    ),
    Photo(
      price: 29.99,
      url: 'assets/DSC_3235_ES1W.jpeg',
    ),
    Photo(
      price: 29.99,
      url: 'assets/DSC_3237_ES1Y.jpeg',
    ),
    Photo(
      price: 29.99,
      url: 'assets/DSC_3239_ES20.jpeg',
    ),
    Photo(
      price: 29.99,
      url: 'assets/DSC_3241_ES22.jpeg',
    ),
    Photo(
      price: 29.99,
      url: 'assets/DSC_3243_ES24.jpeg',
    ),
  ];
}
