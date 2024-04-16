import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pocmytv/models/timelines/timeline.dart';

Future<Map<String, dynamic>> getTimeLineData() async {
  final response = await http.get(
    Uri.parse('https://mytvpocroyal.com/uploads/timelines.json'),
    headers: {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
    },
  );
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load timeline data');
  }
}

Future<List<TimeLineModel>> getTimelines() async {
  final response = await getTimeLineData();
  final List<dynamic> timelines = response['timelines'];
  return timelines.map((json) => TimeLineModel.fromJson(json)).toList();
}

Future<int> getCurrentTimeline() async {
  final response = await getTimeLineData();
  return int.tryParse(response['current'].toString()) ?? 0;
}
