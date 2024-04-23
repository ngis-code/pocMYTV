class ShoppingModel {
  String name;
  String image;
  String price;
  String description;
  String category;
  String id;

  ShoppingModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.description,
      required this.category,
      required this.id});

  ShoppingModel copyWith({
    String? name,
    String? image,
    String? price,
    String? description,
    String? category,
    String? id,
  }) {
    return ShoppingModel(
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      id: id ?? this.id,
    );
  }

  factory ShoppingModel.fromJson(Map<String, dynamic> json) {
    return ShoppingModel(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'category': category,
      'id': id,
    };
  }

  static final List<ShoppingModel> shoppingList = [
    ShoppingModel(
      name: "Shirt",
      image: "assets/images/shirt.jpg",
      price: "100",
      description: "This is a shirt",
      category: "Clothing",
      id: "1",
    ),
    ShoppingModel(
      name: "Pants",
      image: "assets/images/pants.jpg",
      price: "200",
      description: "This is a pants",
      category: "Clothing",
      id: "2",
    ),
    ShoppingModel(
      name: "Shoes",
      image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/air-force-1-07-mens-shoes-jBrhbr.png",
      price: "300",
      description: "This is a shoes",
      category: "Footwear",
      id: "3",
    ),
    ShoppingModel(
      name: "Hat",
      image: "assets/images/hat.jpg",
      price: "50",
      description: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/bafebe89-e689-4493-9663-d9ccfc25da15/dri-fit-adv-club-unstructured-tennis-cap-8jTbjk.png",
      category: "Accessories",
      id: "4",
    ),
    ShoppingModel(
      name: "Socks",
      image: "assets/images/socks.jpg",
      price: "10",
      description: "This is a socks",
      category: "Accessories",
      id: "5",
    ),
    ShoppingModel(
      name: "Gloves",
      image: "assets/images/gloves.jpg",
      price: "20",
      description: "This is a gloves",
      category: "Accessories",
      id: "6",
    ),
  ];
}
