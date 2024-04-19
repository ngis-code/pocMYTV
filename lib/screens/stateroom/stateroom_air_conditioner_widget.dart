import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/stateroom/stateroom_automation.dart';

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
          const Expanded(child: Text('in progress')),
        ],
      ),
    );
  }
}
