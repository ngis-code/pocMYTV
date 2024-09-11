import 'package:flutter/material.dart';
import 'package:pocmytv/screens/stateroom/stateroom_automation.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class StateroomWeatherWidget extends StatelessWidget {
  const StateroomWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: GlassWidget(
        borderRadius: 20,
        backgroundColor: tileBackgroundColor,
        padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/10d@2x.png",
              width: 64,
              height: 64,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Miami",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "28",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      "°C",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
