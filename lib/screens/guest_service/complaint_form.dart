import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/models/complaint.dart/complaint_category.dart';
import 'package:pocmytv/widgets/select_one.dart';

class ComplaintForm extends StatelessWidget {
  final ComplaintCategory category;
  const ComplaintForm({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectOne(
            allOptions: {
              ...category.options,
            },
            onChange: (chosenOption) {
              print(chosenOption);
              return true;
            },
          ),
          const SizedBox(height: 50),
          FocusWidget(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            backgroundColor: Colors.transparent,
            borderRadius: 40,
            onTap: () {},
            child: Text(
              'Submit',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
