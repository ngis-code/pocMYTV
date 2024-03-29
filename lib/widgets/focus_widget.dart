import 'package:flutter/material.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class FocusWidget extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final double borderWidth;
  final Function() onTap;
  const FocusWidget({
    super.key,
    required this.child,
    required this.onTap,
    this.borderRadius = 20,
    this.borderWidth = 5,
  });

  @override
  State<FocusWidget> createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {
  bool hasFocus = false;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      hasFocus = focusNode.hasFocus;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: focusNode,
      onTap: widget.onTap,
      onFocusChange: (hasFocus) {
        setState(() {
          this.hasFocus = hasFocus;
        });
      },
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: hasFocus ? Colors.white : Colors.transparent,
            width: widget.borderWidth,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: GlassWidget(child: widget.child),
      ),
    );
  }
}
