import 'package:flutter/material.dart';

class CenteredListView extends StatefulWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final bool infinte;
  final Axis scrollDirection;

  const CenteredListView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.infinte,
    this.scrollDirection = Axis.vertical,
  });

  @override
  State<CenteredListView> createState() => _CenteredListViewState();
}

class _CenteredListViewState extends State<CenteredListView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight;
      return ListView.builder(
        scrollDirection: widget.scrollDirection,
        itemBuilder: (context, index) {
          if (widget.infinte) {
            index = index % widget.itemCount;
          } else {
            if (index >= widget.itemCount) {
              return SizedBox(width: width / 2);
            } else if (index == 0) {
              return SizedBox(width: width / 2);
            }
            index++;
          }
          return widget.itemBuilder(context, index);
        },
        itemCount: widget.infinte ? null : widget.itemCount + 2,
      );
    });
  }
}
