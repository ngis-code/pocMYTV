import 'package:flutter/material.dart';
import 'package:pocmytv/widgets/drawer_row.dart';
import 'package:pocmytv/widgets/focus_widget.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
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
      body: DrawerRow(
        focusedItem: 2,
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              // const Text("data"),
              SizedBox(
                height: 200,
                child: Timeline.tileBuilder(
                  shrinkWrap: true,
                  builder: TimelineTileBuilder.fromStyle(
                    contentsAlign: ContentsAlign.basic,
                    contentsBuilder: (context, index) {
                      final key = timelines.keys.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: FocusWidget(
                          onFocusChange: (hasFocus) => controller.animateTo(
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
              // ...timelines.values.map(
              //   (e) => SizedBox(
              //     height: height,
              //     child: Center(child: e),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
