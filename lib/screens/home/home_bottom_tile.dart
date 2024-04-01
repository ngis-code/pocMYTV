import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';

class HomeBottomTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final String description;
  final Function() onTap;
  const HomeBottomTile(
      {super.key,
      required this.title,
      required this.description,
      required this.onTap,
      required this.icon});

  @override
  State<HomeBottomTile> createState() => _HomeBottomTileState();
}

class _HomeBottomTileState extends State<HomeBottomTile> {
  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      onTap: widget.onTap,
      borderRadius: 20,
      backgroundColor: Colors.black.withOpacity(0.5),
      borderColor: Colors.white,
      borderWidth: 5,
      blur: 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: height * 0.5,
                child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  child: Icon(widget.icon, color: Colors.white),
                ),
              ),
              SizedBox(
                height: height * 0.25,
                child: FittedBox(
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.25,
                width: width,
                child: Text(
                  widget.description,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white.withOpacity(0.7),
                      ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
