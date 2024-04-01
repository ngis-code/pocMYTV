import 'package:flutter/material.dart';

class WaveAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const WaveAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
  });
  @override
  createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation> {
  static const List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple
  ];

  int _currentColorIndex = 0;

  @override
  void initState() {
    super.initState();
    _change();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: AnimatedContainer(
          duration: widget.duration,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colors[_currentColorIndex],
                colors[(_currentColorIndex + 1) % colors.length],
                colors[(_currentColorIndex + 2) % colors.length],
                colors[(_currentColorIndex + 3) % colors.length],
              ],
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }

  void _change() async {
    await Future.delayed(widget.duration);
    setState(() {
      _currentColorIndex = (_currentColorIndex + 1) % colors.length;
    });
    _change();
  }
}
