import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      enabled: false,
      onTap: () {},
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pop(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(15)),
        child: const Column(
          children: [
            Icon(
              Icons.home_rounded,
              color: Colors.white,
              size: 30,
            ),
            Text(
              'Press Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
