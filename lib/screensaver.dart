import 'package:flutter/material.dart';
import 'package:pocmytv/screens/bubble.dart';
import 'package:pocmytv/widgets/focus_widget.dart';

class ScreenSaver extends StatefulWidget {
  const ScreenSaver({super.key});

  @override
  State<ScreenSaver> createState() => _ScreenSaverState();
}

class _ScreenSaverState extends State<ScreenSaver> {
  @override
  Widget build(BuildContext context) {
    return BubbleAnimation(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 120,
            width: 120,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: "Welcome to your Stateroom ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                // fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Landon Byron',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '\nWe hope you enjoy ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Icon of the seas',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          FocusWidget(
            hasFocus: true,
            borderColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Press any key to continue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   static const _backgroundColor = Color.fromARGB(255, 0, 17, 255);

//   static const _colors = [
//     Color.fromARGB(255, 64, 254, 244),
//     Color.fromARGB(255, 0, 212, 249),
//     Color.fromARGB(255, 0, 249, 187),
//   ];

//   static const _durations = [
//     5000,
//     4000,
//     6000,
//   ];

//   static const _heightPercentages = [
//     0.6,
//     0.7,
//     0.8,
//   ];

    // body: Stack(
    //   children: [
    //     WaveWidget(
    //       config: CustomConfig(
    //         colors: ScreenSaver._colors,
    //         durations: ScreenSaver._durations,
    //         heightPercentages: ScreenSaver._heightPercentages,
    //       ),
    //       backgroundColor: ScreenSaver._backgroundColor,
    //       size: const Size(double.infinity, double.infinity),
    //       waveAmplitude: 0,
    //     ),
    //     Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         mainAxisSize: MainAxisSize.max,
    //         children: [
    //           Image.asset(
    //             'assets/images/logo.png',
    //             height: 120,
    //             width: 120,
    //           ),
    //           const Text(
    //             "Hello Customer",
    //             style: TextStyle(
    //               color: Colors.white,
    //               fontSize: 30,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // ),

    // body: AnimateGradient(
    //   primaryBegin: Alignment.topCenter,
    //   primaryEnd: Alignment.bottomCenter,
    //   secondaryBegin: Alignment.bottomCenter,
    //   secondaryEnd: Alignment.bottomCenter,
    //   duration: const Duration(seconds: 5),
    //   primaryColors: const [
    //     Color(0xFF061556),
    //     Color(0xFF0073BB),
    //   ],
    //   secondaryColors: const [
    //     Color(0xFF061556),
    //     Color(0xFF0073BB),
    //   ],
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       mainAxisSize: MainAxisSize.max,
    //       children: [
    //         Image.asset(
    //           'assets/images/logo.png',
    //           height: 120,
    //           width: 120,
    //         ),
    //         const Text(
    //           "Hello Customer",
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 30,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),