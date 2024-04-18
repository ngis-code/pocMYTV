import 'package:flutter/material.dart';

class BlackScreen extends StatefulWidget {
  final void Function()? onComplete;
  const BlackScreen({super.key, this.onComplete});

  @override
  State<BlackScreen> createState() => _BlackScreenState();
}

class _BlackScreenState extends State<BlackScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1, milliseconds: 500),
      () {
        Navigator.pop(context);
        widget.onComplete?.call();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Image.asset(
        'assets/images/logo.png',
        color: Colors.white,
        height: height / 3,
      )),
    );
  }
}
