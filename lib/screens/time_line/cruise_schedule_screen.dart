import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/widgets/drawer_row.dart';
import 'package:timelines/timelines.dart';

class CruisSchedule extends StatelessWidget {
  CruisSchedule({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final Map<String, Widget> timelines = {
      "Day 1": Text(
        "Day 1",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 2": Text(
        "Day 2",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 3": Text(
        "Day 3",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 4": Text(
        "Day 4",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 5": Text(
        "Day 5",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 6": Text(
        "Day 6",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      "Day 7": Text(
        "Day 7",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
    };
    String oppositeContent = 'Demo Opposite Content';
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 100,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          height: 100,
        ),
      ),
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
                          Text(
                            "Florida, Miami",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.yellow.withOpacity(0.4)),
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
                              backgroundColor: Colors.yellow.withOpacity(0.4),
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
                        width: 350,
                        child: Timeline.tileBuilder(
                          shrinkWrap: true,
                          builder: TimelineTileBuilder.fromStyle(
                            oppositeContentsBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 2.5),
                                child: Text(
                                  oppositeContent,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              );
                            },
                            contentsAlign: ContentsAlign.basic,
                            contentsBuilder: (context, index) {
                              final key = timelines.keys.elementAt(index);
                              return Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: FocusWidget(
                                  focusGroup: 'schedule',
                                  onFocusChange: (hasFocus) =>
                                      controller.animateTo(
                                    0,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  borderRadius: 0,
                                  borderWidth: 2,
                                  onTap: () {
                                    controller.animateTo(
                                      (index + 1) * height,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Text(
                                    key,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              );
                            },
                            itemCount: timelines.length,
                          ),
                        ),
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
