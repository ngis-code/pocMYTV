class Complaint {
  String complaint;
  String category;
  DateTime createdAt;
  DateTime? resolvedAt;
  DateTime? expectedResolveAt;

  double get getProgress {
    final durationToResolve = expectedResolveAt!.difference(DateTime.now());
    final totalDuration = expectedResolveAt!.difference(createdAt);
    return durationToResolve.inSeconds / totalDuration.inSeconds;
  }

  Complaint({
    required this.complaint,
    required this.category,
    required this.createdAt,
    this.resolvedAt,
    this.expectedResolveAt,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      complaint: json['complaint'],
      category: json['category'],
      createdAt: DateTime.parse(json['createdAt']),
      resolvedAt: DateTime.tryParse(json['resolvedAt'].toString()),
      expectedResolveAt:
          DateTime.tryParse(json['expectedResolveAt'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'complaint': complaint,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
      'resolvedAt': resolvedAt?.toIso8601String(),
      'expectedResolveAt': expectedResolveAt?.toIso8601String(),
    };
  }

  static final List<Complaint> complaints = [
    Complaint(
      complaint: "Missing Charges",
      category: "Billing Errors",
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      resolvedAt: DateTime.now(),
      expectedResolveAt: DateTime.now(),
    ),
    Complaint(
      complaint: "Wi-Fi Speed",
      category: "Internet Connectivity",
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      resolvedAt: DateTime.now(),
      expectedResolveAt: DateTime.now(),
    ),
  ];
}
