import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pocmytv/models/timelines/timeline.dart';

// localhost:8080/timelines
Future<List<TimeLineModel>> getTimelines() async {
  final response = await http
      .get(Uri.parse('https://v9nm4hsv-3000.asse.devtunnels.ms/timelines'));
  if (response.statusCode == 200) {
    final List<dynamic> timelines = json.decode(response.body);
    return timelines.map((json) => TimeLineModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load timelines');
  }
}

Future<int> getCurrentTimeline() async {
  final response = await http
      .get(Uri.parse('https://v9nm4hsv-3000.asse.devtunnels.ms/current'));
  if (response.statusCode == 200) {
    return int.tryParse(response.body) ?? 2;
  } else {
    throw Exception('Failed to load current timeline');
  }
}
