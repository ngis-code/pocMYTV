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
            Icons.mail_outline_outlined,
            size: 35,
            color: Colors.white,
          ),
          Positioned(
            bottom: -5,
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 10,
              child: Text(
                "2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
