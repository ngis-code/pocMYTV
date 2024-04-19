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
    extends State<StateroomAirConditionerWidget>
    with SingleTickerProviderStateMixin {
  final double minTemp = 60;
  final double maxTemp = 80;
  final double step = 1;
  double temp = 65;
  double get value => (temp - minTemp) / (maxTemp - minTemp);

  late Animation<double> animation2;
  late AnimationController animationController2;

  @override
  void initState() {
    super.initState();
    animationController2 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    final curvedAnimation2 = CurvedAnimation(
        parent: animationController2, curve: Curves.easeInOutCubic);
    animation2 = Tween<double>(
      begin: 0,
      end: 3.14 + 3.14 / 2,
    ).animate(curvedAnimation2)
      ..addListener(() {
        setState(() {});
      });
    animationController2.animateTo(value);
  }

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
                    if (temp - step >= minTemp) {
                      temp -= step;
                      animationController2.animateTo(value);
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
                        animationController2: animationController2,
                        colors: const [
                          Colors.cyanAccent,
                          Colors.blueAccent,
                          Colors.redAccent,
                        ],
                        value: value,
                      ),
                    ],
                  ),
                ),
                FocusWidget(
                  onTap: () {
                    if (temp + step <= maxTemp) {
                      temp += step;
                      animationController2.animateTo(value);
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
