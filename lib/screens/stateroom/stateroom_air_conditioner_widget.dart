import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/stateroom/stateroom_automation.dart';
import 'package:pocmytv/screens/stateroom/widgets/stateroom_arc.dart';

class StateroomAirConditionerWidget extends StatefulWidget {
  const StateroomAirConditionerWidget({super.key});

  @override
  State<StateroomAirConditionerWidget> createState() =>
      _StateroomAirConditionerWidgetState();
}

class _StateroomAirConditionerWidgetState
    extends State<StateroomAirConditionerWidget> {
  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      onTap: () {
        // code to lock the focus
      },
      borderRadius: 20,
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
          const Expanded(
            child: StateRoomArc(
              colors: [
                Colors.redAccent,
                Colors.purple,
                Colors.blue,
                Colors.blueAccent,
              ],
              value: ((80 - 60) + 60.0) / 100,
            ),
          ),
        ],
      ),
    );
  }
}
