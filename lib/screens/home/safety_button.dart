import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/safety/safety_screen.dart';

class SafetyButton extends StatelessWidget {
  const SafetyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      focusGroup: 'mailButton',
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SafetyScreen(),
        ));
      },
      child: const Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            Icons.safety_check_sharp,
            size: 35,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
