class TimeLineModel {
  String id;
  String title;
  String description;
  bool dock;

  TimeLineModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dock,
  });

  factory TimeLineModel.fromJson(Map<String, dynamic> json) {
    return TimeLineModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      description: json['description'].toString(),
      dock: bool.tryParse(json['dock'].toString()) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dock': dock,
    };
  }

  static final List<TimeLineModel> timelines = [];
  static int processIndex = 2;
}
