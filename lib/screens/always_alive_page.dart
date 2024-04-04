import 'package:flutter/material.dart';

class AlwaysAlivePage extends StatefulWidget {
  final Widget child;
  const AlwaysAlivePage({super.key, required this.child});

  @override
  State<AlwaysAlivePage> createState() => _AlwaysAlivePageState();
}

class _AlwaysAlivePageState extends State<AlwaysAlivePage>
    with AutomaticKeepAliveClientMixin<AlwaysAlivePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
