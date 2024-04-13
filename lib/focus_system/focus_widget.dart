import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocmytv/focus_system/focus_service.dart';
import 'package:pocmytv/services/keyboard_service.dart';
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
  final FocusNode? focusNode;

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
    this.focusNode,
  });

  @override
  State<FocusWidget> createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {
  bool hasFocus = false;
  bool disposed = false;
  bool rejection = false;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    FocusService.add(widget.focusGroup ?? "unknown", focusNode);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      hasFocus = focusNode.hasFocus;
      if (widget.hasFocus) {
        FocusService.requestFocus(widget.focusGroup ?? "unknown", focusNode);
      }
    });
    KeyBoardService.addHandler(_handler);
  }

  @override
  dispose() {
    disposed = true;
    FocusService.remove(widget.focusGroup ?? "unknown", focusNode);
    focusNode.unfocus();
    KeyBoardService.removeHandler(_handler);
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
        if (rejection) {
          rejection = false;
          return;
        }
        // log(hasFocus
        //     ? "Got Focus ${widget.focusGroup ?? 'unknown'}"
        //     : "Lost Focus ${widget.focusGroup ?? 'unknown'}");
        if (hasFocus) {
          final request = FocusService.requestFocus(
              widget.focusGroup ?? "unknown", focusNode);
          // log("Request ${request ? 'approved' : 'rejected'}");
          if (!request) {
            rejection = true;
            return;
          }
        }
        // log("Animating Focus: $hasFocus ${widget.focusGroup ?? 'unknown'}");
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

  bool _handler(KeyEvent event) {
    if (!focusNode.hasFocus || !kIsWeb) return false;
    switch (event.logicalKey) {
      case LogicalKeyboardKey.escape:
      case LogicalKeyboardKey.backspace:
      case LogicalKeyboardKey.goBack:
        if (KeyBoardService.navigatorKey.currentState!.canPop()) {
          KeyBoardService.navigatorKey.currentState!.pop();
        }
        break;
      case LogicalKeyboardKey.arrowUp:
        KeyBoardService.focusInDirection(context, TraversalDirection.up);
        break;
      case LogicalKeyboardKey.arrowDown:
        KeyBoardService.focusInDirection(context, TraversalDirection.down);
        break;
      case LogicalKeyboardKey.arrowLeft:
        KeyBoardService.focusInDirection(context, TraversalDirection.left);
        break;
      case LogicalKeyboardKey.arrowRight:
        KeyBoardService.focusInDirection(context, TraversalDirection.right);
        break;
    }
    return true;
  }
}
