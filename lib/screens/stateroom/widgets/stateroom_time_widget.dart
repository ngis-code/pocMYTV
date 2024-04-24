import 'package:flutter/material.dart';
import 'package:pocmytv/extensions/datetime_extensions.dart';
import 'package:pocmytv/screens/stateroom/stateroom_automation.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:pocmytv/widgets/clock.dart';

class StateroomTimeWidget extends StatelessWidget {
  const StateroomTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: ClockWidget(
        builder: (context, time) {
          return GlassWidget(
            borderRadius: 20,
            backgroundColor: tileBackgroundColor,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time.toMonthString(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
                Text(
                  "${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
