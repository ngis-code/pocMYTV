import 'package:flutter/material.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class LiveTvScreen extends StatefulWidget {
  const LiveTvScreen({super.key});

  @override
  State<LiveTvScreen> createState() => _LiveTvScreenState();
}

class _LiveTvScreenState extends State<LiveTvScreen> {
  @override
  Widget build(BuildContext context) {
    return GlassWidget(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Image.network(
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F321725967125325120%2F&psig=AOvVaw0jksR3UlzrXUHkSKQwrn1b&ust=1712335388183000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOCToMaAqYUDFQAAAAAdAAAAABAJ',
          ),
          title: const Text('HDMI 1'),
          subtitle: const Text('HDMI 1'),
        ),
      ],
    ));
  }
}
