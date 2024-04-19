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
  double values = ((80 - 60) + 60.0) / 100;
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
          Expanded(
            child: StateRoomArc(
              colors: const [
                Colors.blue,
                Colors.blueAccent,
                Colors.purple,
                Colors.redAccent,
              ],
              value: values,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    values = values - 0.1;
                  });
                },
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    values = values + 0.1;
                  });
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
