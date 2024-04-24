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
      url: 'https://mytvpocroyal.com/uploads/DSC_3234_ES1V.JPG',
    ),
    Photo(
      price: 29.99,
      url: 'https://mytvpocroyal.com/uploads/DSC_3235_ES1W.JPG',
    ),
    Photo(
      price: 29.99,
      url: 'https://mytvpocroyal.com/uploads/DSC_3237_ES1Y.JPG',
    ),
    Photo(
      price: 29.99,
      url: 'https://mytvpocroyal.com/uploads/DSC_3239_ES20.JPG',
    ),
    Photo(
      price: 29.99,
      url: 'https://mytvpocroyal.com/uploads/DSC_3241_ES22.JPG',
    ),
    Photo(
      price: 29.99,
      url: 'https://mytvpocroyal.com/uploads/DSC_3243_ES24.JPG',
    ),
  ];
}
