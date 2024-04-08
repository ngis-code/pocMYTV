import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pocmytv/models/timelines/timeline.dart';
import 'package:pocmytv/globals.dart';

Future<List<TimeLineModel>> getTimelines() async {
  final response = await http.get(Uri.parse('$serverUrl/timelines'));
  if (response.statusCode == 200) {
    final List<dynamic> timelines = json.decode(response.body);
    return timelines.map((json) => TimeLineModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load timelines');
  }
}

Future<int> getCurrentTimeline() async {
  final response = await http.get(Uri.parse('$serverUrl/current'));
  if (response.statusCode == 200) {
    return int.tryParse(response.body) ?? 2;
  } else {
    throw Exception('Failed to load current timeline');
  }
}
