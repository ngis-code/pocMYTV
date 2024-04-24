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

  static List<Photo> allPhotos = [];
}
