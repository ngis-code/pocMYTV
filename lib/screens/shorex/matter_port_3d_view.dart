import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pocmytv/extensions/string_extensions.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShipXScreen extends StatefulWidget {
  const ShipXScreen({super.key});

  @override
  State<ShipXScreen> createState() => _ShipXScreenState();
}

class _ShipXScreenState extends State<ShipXScreen> {
  late final WebViewController _controller;
  String error = "";

  @override
  void initState() {
    super.initState();
    try {
      _controller = WebViewController();
      _controller.loadRequest(Uri.parse(
          'https://my.matterport.com/show/?play=1&share=0&m=h1MEqdqBkXq'));
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BackgroundVideo(
        backgroundWidget: Container(),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: error.isEmpty
              ? WebViewWidget(controller: _controller)
              : Center(
                  child: Text(
                    'Webview is not supported on ${Platform.operatingSystem.toPascalCase()}.\nUse the iOS or web app to view the content.\n\nWe are working on this and this view will be available soon.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
        ),
      ),
    );
  }
}
