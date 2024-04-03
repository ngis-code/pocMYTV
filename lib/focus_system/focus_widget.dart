import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_service.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class FocusWidget extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final double borderWidth;
  final double blur;
  final Color backgroundColor;
  final Color borderColor;
  final Color? focusColor;
  final bool hasFocus;
  final EdgeInsets padding;
  final String? focusGroup;
  final bool enabled;
  final Function() onTap;
  final Function(bool hasFocus)? onFocusChange;

  const FocusWidget({
    super.key,
    required this.child,
    required this.onTap,
    this.borderRadius = 20,
    this.borderWidth = 5,
    this.blur = 0,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.white,
    this.hasFocus = false,
    this.onFocusChange,
    this.padding = EdgeInsets.zero,
    this.focusColor,
    this.focusGroup,
    this.enabled = true,
  });

  @override
  State<FocusWidget> createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {
  bool hasFocus = false;
  bool disposed = false;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    FocusService.add(widget.focusGroup ?? "unknown", focusNode);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      hasFocus = focusNode.hasFocus;
      if (widget.hasFocus) {
        FocusService.requestFocus(widget.focusGroup ?? "unknown", focusNode);
      }
    });
    super.initState();
  }

  @override
  dispose() {
    disposed = true;
    FocusService.remove(widget.focusGroup ?? "unknown", focusNode);
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: widget.focusColor,
      focusNode: focusNode,
      onTap: widget.enabled ? widget.onTap : null,
      onFocusChange: (hasFocus) {
        if (disposed) return;
        // log(hasFocus
        //     ? "Got Focus ${widget.focusGroup ?? 'unknown'}"
        //     : "Lost Focus ${widget.focusGroup ?? 'unknown'}");
        if (hasFocus &&
            !FocusService.requestFocus(
                widget.focusGroup ?? "unknown", focusNode)) {
          return;
        }
        log("Animating Focus: $hasFocus ${widget.focusGroup ?? 'unknown'}");
        setState(() {
          this.hasFocus = hasFocus;
        });
        widget.onFocusChange?.call(hasFocus);
      },
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: GlassWidget(
        radius: widget.borderRadius,
        blur: widget.blur,
        child: Container(
          padding: widget.padding,
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
