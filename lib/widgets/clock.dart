import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  final Widget Function(BuildContext context, DateTime time) builder;
  final bool updatePerSec;
  const ClockWidget(
      {super.key, required this.builder, this.updatePerSec = false});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  bool disposed = false;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, DateTime.now());
  }

  Future<void> _updateTime() async {
    final millisecTillNextMinute = widget.updatePerSec
        ? 1000 - DateTime.now().millisecond
        : 60 * 1000 - DateTime.now().millisecond;
    await Future.delayed(Duration(milliseconds: millisecTillNextMinute));
    if (!disposed) {
      setState(() {});
      _updateTime();
    }
  }
}
