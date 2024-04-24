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
      price: 134.99,
      url:
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1593634805410-NC149C7M0QCJMMUMLJ3J/colors+01+copy+4.jpg?format=1500w',
    ),
    Photo(
      price: 400.99,
      url:
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1594317631484-6JNSTCSQZWE8GASE1M5W/Ca_10.jpg?format=1500w',
    ),
    Photo(
      price: 34.99,
      liked: true,
      url:
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1594320847160-DSJPBO63J6PLNCXXZ274/Ca_12.jpg?format=1500w',
    ),
    Photo(
      price: 256.99,
      url:
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1594323275851-08KBXHEHN2F4SIOYUJNB/Ca_18.png?format=1500w',
    ),
    Photo(
      price: 134.99,
      url:
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/4cd53c9c-585a-408e-accf-bff8dc024332/getty-images-IJOEYzY5sek-unsplash.jpg',
    ),
    Photo(
      price: 123.99,
      url:
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/2fcfb85b-6f9b-4271-b7b9-68a2ef424a38/Frame+460785.jpg?format=1500w',
    ),
  ];
}
