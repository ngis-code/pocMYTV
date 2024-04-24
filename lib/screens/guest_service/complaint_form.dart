import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/models/complaint.dart/complaint.dart';
import 'package:pocmytv/models/complaint.dart/complaint_category.dart';
import 'package:pocmytv/screens/guest_service/guest_service_screen.dart';
import 'package:pocmytv/screens/main_page.dart';
import 'package:pocmytv/widgets/select_one.dart';

class ComplaintForm extends StatefulWidget {
  final ComplaintCategory category;

  const ComplaintForm({super.key, required this.category});

  @override
  State<ComplaintForm> createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  String? chosenOption;
  String? err;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectOne(
            hasFocus: true,
            expanded: true,
            selectedOption: chosenOption,
            allOptions: {
              ...widget.category.options,
            },
            onChange: (chosenOption) {
              this.chosenOption = chosenOption;
              return true;
            },
          ),
          const SizedBox(height: 50),
          if (widget.category.showTextBox)
            SizedBox(
              width: math.max(700, width / 3),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  hoverColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Enter your complaint',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  chosenOption = value;
                },
              ),
            ),
          const SizedBox(height: 50),
          FocusWidget(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            backgroundColor: Colors.transparent,
            borderRadius: 40,
            onTap: () {
              if (chosenOption == null || chosenOption!.isEmpty) {
                setState(() {
                  err = 'Please select an option';
                });
                return;
              }
              Complaint.complaints.insert(
                0,
                Complaint(
                  complaint: chosenOption!,
                  category: widget.category.title,
                  createdAt: DateTime.now(),
                  expectedResolveAt: DateTime.now().add(
                    const Duration(minutes: 1),
                  ),
                ),
              );
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ),
                (route) => false,
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GuestServiceScreen(),
                ),
              );
            },
            child: Text(
              'Submit',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          if (err != null)
            Text(
              err!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
            ),
        ],
      ),
    );
  }
}
