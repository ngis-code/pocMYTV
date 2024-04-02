import 'package:flutter/material.dart';
import 'package:pocmytv/widgets/drawer_row.dart';
import 'package:timelines/timelines.dart';

import '../../widgets/process_time_line.dart';

class CruisSchedule extends StatelessWidget {
  CruisSchedule({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://wallpapers-all.com/uploads/posts/2016-11/4_thailand.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: DrawerRow(
          focusedItem: 3,
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                SizedBox(
                  height: height - 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.sunny,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "33 °C",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.timeline,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "8:10 AM",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Florida, Miami",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFFfdde6c),
                            ),
                          ),
                          const Text(
                            "Departure: Aug 12th 07:00 PM",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            focusNode: FocusNode(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFfdde6c),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            child: Text(
                              'discover your next destination'.toUpperCase(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: 500,
                          height: height,
                          child: const RotatedBox(
                              quarterTurns: 1, child: ProcessTimelinePage())
                          // child: Timeline.tileBuilder(
                          //   shrinkWrap: true,
                          //   theme: TimelineThemeData(
                          //     color: Colors.white,
                          //   ),
                          //   builder: TimelineTileBuilder.fromStyle(
                          //     oppositeContentsBuilder: (context, index) {
                          //       return Padding(
                          //         padding: const EdgeInsets.only(right: 2.5),
                          //         child: Text(
                          //           oppositeContent,
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .labelLarge!
                          //               .copyWith(
                          //                 color: Colors.white,
                          //                 fontWeight: FontWeight.w600,
                          //                 fontSize: 20,
                          //               ),
                          //         ),
                          //       );
                          //     },
                          //     contentsAlign: ContentsAlign.basic,
                          //     contentsBuilder: (context, index) {
                          //       final key = timelines.keys.elementAt(index);
                          //       return Padding(
                          //         padding: const EdgeInsets.all(24.0),
                          //         child: FocusWidget(
                          //           focusGroup: 'schedule',
                          //           onFocusChange: (hasFocus) =>
                          //               controller.animateTo(
                          //             0,
                          //             duration: const Duration(seconds: 1),
                          //             curve: Curves.easeInOut,
                          //           ),
                          //           padding: const EdgeInsets.all(5),
                          //           borderRadius: 0,
                          //           borderWidth: 2,
                          //           onTap: () {
                          //             controller.animateTo(
                          //               (index + 1) * height,
                          //               duration: const Duration(seconds: 1),
                          //               curve: Curves.easeInOut,
                          //             );
                          //           },
                          //           child: Text(
                          //             key,
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .labelLarge!
                          //                 .copyWith(
                          //                   color: Colors.white,
                          //                 ),
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //     itemCount: timelines.length,
                          //   ),
                          // ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
