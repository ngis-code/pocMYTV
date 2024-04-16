import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/utils/shader_widget.dart';
import 'package:pocmytv/widgets/clock.dart';

class StateRoom extends StatefulWidget {
  const StateRoom({super.key});

  @override
  State<StateRoom> createState() => _StateRoomState();
}

class _StateRoomState extends State<StateRoom> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BackgroundVideo(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    ClockWidget(
                      builder: (context, time) {
                        return Text(
                          '${time.hour}:${time.minute}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height / 15,
                              fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    Text(
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height / 30,
                      ),
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.sunny, color: Colors.white),
                        Text('28 C', style: TextStyle(color: Colors.white)),
                      ],
                    )
                  ],
                ),
                // Image.asset(
                //   'assets/images/ship_info.webp',
                //   width: width / 2,
                  
                //   height: height / 2,
                //   fit: BoxFit.cover,
                // )
                Container(
                  width: width / 2,
                  height: height / 2,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius  .all(
                      Radius.circular(20),
                    ),  
                    image: DecorationImage(
                      image: AssetImage('assets/images/ship_info.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: GridView.count(
                    crossAxisCount: 3,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width / 4,
                vertical: height / 10,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF061556),
                      Color(0xFF2B6FC0),
                      Color(0xFF131C49),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ShaderWidget(
                      colors: const [
                        Colors.blue,
                        Colors.red,
                      ],
                      child: Text(
                        "Music",
                        style: TextStyle(fontSize: height / 30),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Music",
                          style: TextStyle(
                              color: Colors.white, fontSize: height / 40),
                        ),
                        Text(
                          "Music",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.6),
                              fontSize: height / 40),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.fast_rewind_rounded,
                      color: Colors.white,
                      size: height / 35,
                    ),
                    Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: height / 35,
                    ),
                    Icon(
                      Icons.fast_forward_rounded,
                      color: Colors.white,
                      size: height / 35,
                    ),
                    Icon(
                      Icons.list,
                      color: Colors.white,
                      size: height / 35,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// window.location.href = "https://deeplink.recruitpick.com/web";