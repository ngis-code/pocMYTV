import 'package:flutter/material.dart';
import 'package:pocmytv/widgets/focus_widget.dart';

class CenteredListView extends StatefulWidget {
  final Widget Function(BuildContext context, int index, bool hasFocus)
      itemBuilder;
  final void Function(int index) onTap;
  final void Function(int index)? onFocusChange;
  final int itemCount;
  final bool infinte;
  final Axis scrollDirection;
  final double itemHeight;
  final double expandedItemHeight;
  final Duration duration;
  final double borderRadius;
  final double borderWidth;
  final double blur;
  final Color backgroundColor;
  final Color borderColor;
  final Color? focusColor;
  final int? focusedItem;

  const CenteredListView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.infinte = false,
    this.scrollDirection = Axis.vertical,
    this.itemHeight = 100,
    required this.onTap,
    required this.expandedItemHeight,
    required this.duration,
    this.borderRadius = 20,
    this.borderWidth = 5,
    this.blur = 0,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.white,
    this.focusColor,
    this.focusedItem,
    this.onFocusChange,
  });

  @override
  State<CenteredListView> createState() => _CenteredListViewState();
}

class _CenteredListViewState extends State<CenteredListView> {
  late final scrollController;

  @override
  void initState() {
    super.initState();
    // if (widget.focusedItem != null) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   scrollController.animateTo(
    //       widget.focusedItem! * widget.itemHeight +
    //           widget.expandedItemHeight / 2,
    //       duration: const Duration(milliseconds: 300),
    //       curve: Curves.ease);
    // });
    // }
    scrollController = ScrollController(
      initialScrollOffset: widget.focusedItem != null
          ? widget.focusedItem! * widget.itemHeight +
              widget.expandedItemHeight / 2
          : 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight;
      return ListView.builder(
        controller: scrollController,
        scrollDirection: widget.scrollDirection,
        itemBuilder: (context, index) {
          Widget padWidget = widget.scrollDirection == Axis.horizontal
              ? SizedBox(width: width / 2 - widget.itemHeight / 2)
              : SizedBox(height: height / 2 - widget.itemHeight / 2);
          if (widget.infinte) {
            index = index % widget.itemCount;
          } else {
            if (index == widget.itemCount + 1) {
              return padWidget;
            } else if (index == 0) {
              return padWidget;
            }
            index--;
          }
          return CenteredListTile(
            focused: widget.focusedItem == index,
            duration: widget.duration,
            itemHeight: widget.itemHeight,
            borderRadius: widget.borderRadius,
            borderWidth: widget.borderWidth,
            blur: widget.blur,
            backgroundColor: widget.backgroundColor,
            borderColor: widget.borderColor,
            focusColor: widget.focusColor,
            expandedItemHeight: widget.expandedItemHeight,
            builder: (hasFocus) => widget.itemBuilder(context, index, hasFocus),
            onTap: () {
              widget.onTap(index);
            },
            onReceiveFocus: () {
              // scrolling the listview to this element
              scrollController.animateTo(
                  index * widget.itemHeight + widget.expandedItemHeight / 2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease);
              widget.onFocusChange?.call(index);
            },
          );
        },
        itemCount: widget.infinte ? null : widget.itemCount + 2,
      );
    });
  }
}

class CenteredListTile extends StatefulWidget {
  final Widget Function(bool hasFocus) builder;
  final void Function()? onLoseFocus;
  final void Function() onReceiveFocus;
  final void Function() onTap;
  final double expandedItemHeight;
  final double itemHeight;
  final Duration duration;
  final double borderRadius;
  final double borderWidth;
  final double blur;
  final Color backgroundColor;
  final Color borderColor;
  final Color? focusColor;
  final bool focused;

  const CenteredListTile({
    super.key,
    required this.onReceiveFocus,
    required this.onTap,
    this.onLoseFocus,
    required this.expandedItemHeight,
    required this.duration,
    required this.itemHeight,
    this.borderRadius = 20,
    this.borderWidth = 5,
    this.blur = 0,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.white,
    this.focusColor,
    required this.builder,
    this.focused = false,
  });

  @override
  State<CenteredListTile> createState() => _CenteredListTileState();
}

class _CenteredListTileState extends State<CenteredListTile> {
  bool hasFocus = false;

  @override
  void initState() {
    hasFocus = widget.focused;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      hasFocus: widget.focused,
      borderRadius: widget.borderRadius,
      borderWidth: widget.borderWidth,
      blur: widget.blur,
      backgroundColor: widget.backgroundColor,
      borderColor: widget.borderColor,
      focusColor: widget.focusColor,
      onTap: () {
        widget.onTap();
      },
      onFocusChange: (hasFocus) {
        setState(() {
          this.hasFocus = hasFocus;
        });
        if (hasFocus) {
          widget.onReceiveFocus();
        } else {
          widget.onLoseFocus?.call();
        }
      },
      child: AnimatedContainer(
        alignment: Alignment.center,
        height: hasFocus ? widget.expandedItemHeight : widget.itemHeight,
        duration: widget.duration,
        child: widget.builder(hasFocus),
      ),
    );
  }
}
