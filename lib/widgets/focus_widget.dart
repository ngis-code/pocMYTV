import 'package:flutter/material.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class FocusWidget extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final double borderWidth;
  final double blur;
  final Color backgroundColor;
  final Color borderColor;
  final Function() onTap;

  const FocusWidget({
    super.key,
    required this.child,
    required this.onTap,
    this.borderRadius = 20,
    this.borderWidth = 5,
    this.blur = 0,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.white,
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
      child: GlassWidget(
        radius: widget.borderRadius,
        blur: widget.blur,
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: hasFocus ? widget.borderColor : Colors.transparent,
              width: widget.borderWidth,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: widget.child,
        ),
      ),
    );
  }
}
