import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';

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
        leading: FocusWidget(
          onTap: () => Navigator.of(context).pop(),
          borderColor: Colors.black,
          child: const BackButton(
            color: Colors.black,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Image.asset(
        'assets/IC_MyTV_B2.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
