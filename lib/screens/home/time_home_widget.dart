import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocmytv/widgets/clock.dart';

class TimeHomeWidget extends StatelessWidget {
  const TimeHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClockWidget(
      builder: (context, time) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat('EEEE, MMMM d').format(DateTime.now()),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
