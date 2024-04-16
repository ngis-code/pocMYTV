import 'package:flutter/material.dart';

class ComplaintsList extends StatelessWidget {
  const ComplaintsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Complaints List',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white,
          ),
    );
  }
}
