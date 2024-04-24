import 'package:flutter/material.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShipXScreen extends StatefulWidget {
  const ShipXScreen({super.key});

  @override
  State<ShipXScreen> createState() => _ShipXScreenState();
}

class _ShipXScreenState extends State<ShipXScreen> {
  final WebViewController _controller = WebViewController();

  @override
  void initState() {
    super.initState();
    _controller.loadRequest(Uri.parse(
        'https://my.matterport.com/show/?play=1&share=0&m=h1MEqdqBkXq'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundVideo(
        backgroundWidget: Container(),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: WebViewWidget(controller: _controller),
        ),
      ),
    );
  }
}
