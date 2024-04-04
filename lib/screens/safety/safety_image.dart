import 'package:flutter/material.dart';

class SafetyImage extends StatefulWidget {
  const SafetyImage({super.key});

  @override
  State<SafetyImage> createState() => _SafetyImageState();
}

class _SafetyImageState extends State<SafetyImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Image.network(
        'https://deeplink.recruitpick.com/uploads/IC_MyTV_B2.pnghttps://deeplink.recruitpick.com/uploads/IC_MyTV_B2.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
