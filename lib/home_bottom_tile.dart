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
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: hasFocus ? Colors.white : Colors.transparent,
            width: 5,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, size: 80, color: Colors.white),
            const SizedBox(height: 10),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white),
              ),
            ),
            Text(
              widget.description,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white.withOpacity(0.7)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
