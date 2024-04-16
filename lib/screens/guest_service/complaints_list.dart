import 'package:flutter/material.dart';
import 'package:pocmytv/extensions/datetime_extensions.dart';
import 'package:pocmytv/extensions/string_extensions.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/models/complaint.dart/complaint.dart';
import 'package:pocmytv/widgets/clock.dart';

class ComplaintsList extends StatelessWidget {
  const ComplaintsList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width / 3,
      child: Complaint.complaints.isEmpty
          ? Text(
              'No complaints found',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: Complaint.complaints.length,
                itemBuilder: (context, index) {
                  final complaint = Complaint.complaints[index];
                  return FocusWidget(
                    onTap: () {},
                    child: ListTile(
                      title: Text(
                        complaint.complaint.replaceAll('_', ' ').toPascalCase(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            complaint.category
                                .replaceAll('_', ' ')
                                .toPascalCase(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Text(
                            complaint.createdAt.toMonthString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                      trailing: ClockWidget(
                        updatePerSec: true,
                        builder: (context, time) {
                          final durationToResolve = complaint.expectedResolveAt!
                              .difference(DateTime.now());
                          if (complaint.expectedResolveAt!
                                  .isBefore(DateTime.now()) ||
                              complaint.resolvedAt != null) {
                            complaint.resolvedAt = DateTime.now();
                            return const Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 40,
                            );
                          }
                          return Stack(
                            children: [
                              SizedBox(
                                height: 70,
                                width: 50,
                                child: CircularProgressIndicator(
                                  value: complaint.getProgress,
                                ),
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    "${durationToResolve.inMinutes}:${durationToResolve.inSeconds % 60}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
