import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/stateroom/stateroom_automation.dart';
import 'package:pocmytv/screens/stateroom/widgets/stateroom_arc.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class StateroomAirConditionerWidget extends StatefulWidget {
  const StateroomAirConditionerWidget({super.key});

  @override
  State<StateroomAirConditionerWidget> createState() =>
      _StateroomAirConditionerWidgetState();
}

class _StateroomAirConditionerWidgetState
    extends State<StateroomAirConditionerWidget> {
  final double minTemp = 60;
  final double maxTemp = 80;
  final double step = 1;
  double temp = 60;

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      radius: 20,
      backgroundColor: tileBackgroundColor,
      padding: EdgeInsets.all(tilePadding),
      child: Column(
        children: [
          Text(
            "Air Conditioner",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              children: [
                FocusWidget(
                  onTap: () {
                    if (temp + step >= minTemp) {
                      setState(() {
                        temp -= step;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          "${temp.toStringAsFixed(0)}°F",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      StateRoomArc(
                        colors: const [
                          Colors.redAccent,
                          Colors.purple,
                          Colors.blue,
                          Colors.blueAccent,
                        ],
                        value: (temp - minTemp) / (maxTemp - minTemp),
                      ),
                    ],
                  ),
                ),
                FocusWidget(
                  onTap: () {
                    if (temp + step <= maxTemp) {
                      setState(() {
                        temp += step;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
