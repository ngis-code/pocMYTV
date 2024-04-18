import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocmytv/extensions/datetime_extensions.dart';
import 'package:pocmytv/extensions/string_extensions.dart';
import 'package:pocmytv/models/complaint.dart/complaint.dart';
import 'package:pocmytv/screens/notification/parallex_promotional_ads.dart';
import 'package:pocmytv/services/keyboard_service.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class ComplaintInfo extends StatefulWidget {
  final Complaint complaint;
  const ComplaintInfo({super.key, required this.complaint});

  @override
  State<ComplaintInfo> createState() => _ComplaintInfoState();
}

class _ComplaintInfoState extends State<ComplaintInfo> {
  bool disposed = false;

  @override
  void initState() {
    super.initState();
    KeyBoardService.addHandler(_handler);
  }

  @override
  void dispose() {
    disposed = true;
    KeyBoardService.removeHandler(_handler);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      radius: 20,
      backgroundColor: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.complaint.complaint.replaceAll('_', ' ').toPascalCase(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: darkBlue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Complaint Category: ${widget.complaint.category}',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: darkBlue,
                  ),
            ),
            Text(
              'Created At: ${widget.complaint.createdAt.toMonthString()} ${widget.complaint.createdAt.amPmTime}',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: darkBlue,
                  ),
            ),
            if (widget.complaint.resolvedAt != null)
              Text(
                'Resolved At: ${widget.complaint.resolvedAt?.toMonthString()} ${widget.complaint.resolvedAt?.amPmTime}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: darkBlue,
                    ),
              ),
            if (widget.complaint.expectedResolveAt != null)
              Text(
                "Expected Resolution Time: ${widget.complaint.expectedResolveAt?.toMonthString()} ${widget.complaint.expectedResolveAt?.amPmTime}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: darkBlue,
                    ),
              ),
          ],
        ),
      ),
    );
  }

  bool _handler(KeyEvent event) {
    if (disposed) return false;
    log("complaint info manager called");
    if (event.logicalKey == LogicalKeyboardKey.escape ||
        event.logicalKey == LogicalKeyboardKey.backspace ||
        event.logicalKey == LogicalKeyboardKey.goBack) {
      disposed = true;
      Navigator.of(context).pop();
    }
    return true;
  }
}
