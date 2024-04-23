import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaetherTimeHomeWidget extends StatelessWidget {
  const WaetherTimeHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            RichText(
              text: TextSpan(
                text: "76°",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.white,
                    ),
                children: [
                  TextSpan(
                    text: " / 24°C ",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const WidgetSpan(child: SizedBox(width: 10))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.sunrise,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text('6:30 AM',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith()),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.black26,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.sunset,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '8:40 PM',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.sun_max,
              size: 50,
              color: Color(0xffd6e14a),
            ),
            Text(
              'Sunny',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
