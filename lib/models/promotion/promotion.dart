class Promotion {
  String title;
  String description;
  String imgUrl;

  Promotion({
    required this.title,
    required this.description,
    required this.imgUrl,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      title: json['title'].toString(),
      description: json['description'].toString(),
      imgUrl: json['imgUrl'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imgUrl': imgUrl,
    };
  }

  static List<Promotion> allPromotions() {
    return [
      Promotion(
        title: 'AI Promotional Guest',
        description: '20% off on Gucci accessories only for you',
        imgUrl: 'assets/8-11.jpg',
      ),
      Promotion(
        title: 'AI Promotional Guest',
        description: '20% off on Gucci accessories only for you',
        imgUrl:
            'assets/gi7jmsnpvb1c1.jpg',
      ),
      Promotion(
        title: 'AI Promotional Guest',
        description: '20% off on Gucci accessories only for you',
        imgUrl: 'assets/RCI-Cyber-Sale-1__ScaleWidthWzEyMDBd.png',
      ),
    ];
  }
}
