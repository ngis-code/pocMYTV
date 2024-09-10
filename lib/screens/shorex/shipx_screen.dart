// import 'dart:io';
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_tizen/webview_flutter_tizen.dart';

class ShipXScreen extends StatefulWidget {
  const ShipXScreen({super.key});

  @override
  State<ShipXScreen> createState() => _ShipXScreenState();
}

class _ShipXScreenState extends State<ShipXScreen> {
  // late final WebViewController _controller;
  String error = "";

  @override
  void initState() {
    super.initState();
    try {
      ui.platformViewRegistry.registerViewFactory(
          'test-view-type',
          (int viewId) => IFrameElement()
            ..width = '640'
            ..height = '360'
            ..src =
                "https://my.matterport.com/show/?play=1&share=0&m=h1MEqdqBkXq"
            ..style.border = 'none');

      // _controller = WebViewController(
      //   onPermissionRequest: (request) async {
      //     await request.grant();
      //     setState(() {});
      //   },
      // );
      // if (!Platform.isIOS && !Platform.isAndroid && !kIsWeb) {
      //   _controller.tizenEnginePolicy = true;
      // }
      // _controller.loadRequest(
      //     Uri.parse(
      //       // 'https://my.matterport.com/show/?play=1&share=0&m=h1MEqdqBkXq',
      //       'https://www.google.com',
      //     ),
      //     headers: {
      //       "Access-Control-Allow-Origin": "*",
      //     });
    } catch (e) {
      setState(() {
        error = e.toString();
        print('Error: $error');
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
              ? FocusWidget(
                  onTap: () {},
                  blur: 0,
                  borderRadius: 0,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  hasFocus: true,
                  // child: WebViewWidget(controller: _controller),
                  child: const HtmlElementView(viewType: 'test-view-type'),
                )
              : Center(
                  child: Text(
                    'Webview is not supported on this platform.\nUse the iOS or web app to view the content.\n\nWe are working on this and this view will be available soon.',
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
