import 'package:pocmytv/models/timelines/timeline.dart';

Future<Map<String, dynamic>> getTimeLineData() async {
  // final response = await http.get(
  //   Uri.parse(kDebugMode && kIsWeb
  //       ? 'https://v9nm4hsv-3002.asse.devtunnels.ms/timelines.json'
  //       : 'https://mytvpocroyal.com/uploads/timelines.json'),
  //   headers: {
  //     'Content-Type': 'application/json',
  //     'Access-Control-Allow-Origin': '*',
  //   },
  // );
  // if (response.statusCode == 200) {
  //   return json.decode(response.body);
  // } else {
  //   throw Exception('Failed to load timeline data');
  // }
  return {
    "timelines": [
      {
        "id": "1",
        "title": "Day 1",
        "description": "Miami Florida",
        "dock": true
      },
      {"id": "2", "title": "Day 2", "description": "Cococay", "dock": false},
      {
        "id": "3",
        "title": "Day 3",
        "description": "Miami Florida",
        "dock": false
      },
      {
        "id": "4",
        "title": "Day 4",
        "description": "Miami Florida",
        "dock": true
      },
      {
        "id": "5",
        "title": "Day 5",
        "description": "Miami Florida",
        "dock": false
      }
    ],
    "current": "1"
  };
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
