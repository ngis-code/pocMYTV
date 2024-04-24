class RoomServiceModel {
  String title;
  String description;
  String price;
  String image;
  int id;
  double rating;

  RoomServiceModel({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.id,
    required this.rating,
  });

  // Make copyWith method
  RoomServiceModel copyWith(
      {String? title,
      String? description,
      String? price,
      String? image,
      double? rating,
      int? id}) {
    return RoomServiceModel(
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        id: id ?? this.id);
  }

  // Make fromJson method
  factory RoomServiceModel.fromJson(Map<String, dynamic> json) {
    return RoomServiceModel(
        title: json['title'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
        rating: json['rating'],
        id: json['id']);
  }

  // Add random data to a list
  static final List<RoomServiceModel> roomServices = [
    RoomServiceModel(
      title: 'Room Service 1',
      description: 'Description 1',
      price: '100',
      id: 0,
      rating: 4.5,
      image:
          'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=800',
    ),
    RoomServiceModel(
      title: 'Room Service 2',
      description: 'Description 2',
      price: '200',
      rating: 2.2,
      id: 1,
      image:
          'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=800',
    ),
    RoomServiceModel(
      title: 'Room Service 3',
      description: 'Description 3',
      price: '300',
      id: 2,
      rating: 3.5,
      image:
          'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=800',
    ),
    RoomServiceModel(
      title: 'Room Service 4',
      description: 'Description 4',
      price: '400',
      id: 3,
      rating: 4.0,
      image:
          'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=800',
    ),
  ];
}
