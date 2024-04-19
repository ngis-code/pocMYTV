import 'package:flutter/material.dart';
import 'package:pocmytv/screens/stateroom/stateroom_automation.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class StateroomStatsTile extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  const StateroomStatsTile(
      {super.key,
      required this.title,
      required this.value,
      required this.unit,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      padding: EdgeInsets.all(tilePadding),
      backgroundColor: tileBackgroundColor,
      radius: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    value,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    unit,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              Icon(
                icon,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
