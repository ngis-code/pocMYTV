import 'package:flutter/material.dart';

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
  bool hasFocus = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onFocusChange: (hasFocus) {
        setState(() {
          this.hasFocus = hasFocus;
        });
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: hasFocus ? Colors.white : Colors.transparent,
            width: 5,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: LayoutBuilder(builder: (context, constraints) {
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
        }),
      ),
    );
  }
}
