import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/utils/shader_widget.dart';
import 'package:pocmytv/widgets/clock.dart';

class StateRoom extends StatefulWidget {
  const StateRoom({super.key});

  @override
  State<StateRoom> createState() => _StateRoomState();
}

class _StateRoomState extends State<StateRoom> {
  List<String> stateroomObjective = [
    'AC',
    'Curtains',
    'Theme',
  ];

  // !!Theme like: Day-Time, Movie, BedTime, etc,.
  // !!Even for something for the Stateroom Automation
  // !!Animation in the homepage with the ship

  bool dateTime = false;
  bool movieTime = true;
  bool bedTime = false;

  int acTemp = 28;
  bool curtainSwitch = false;
  bool lightOnOrOffToggle = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BubbleAnimation(
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
                    ),
                    Row(
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: CupertinoSwitch(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                        // CupertinoSwitch(value: false, onChanged: (value) {}),
                        // CupertinoSwitch(value: false, onChanged: (value) {}),
                      ],
                    ),
                  ],
                ),
                Container(
                    width: width / 1.2,
                    height: height / 1.5,
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            height: height / 4,
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://kobiecomplete.com/wp-content/uploads/2017/07/daikin-ductless-air-conditioning-680.jpg',
                                  ),
                                  fit: BoxFit.cover),
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
                            padding: const EdgeInsets.only(
                                left: 20, top: 10, right: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stateroomObjective[0],
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(.8),
                                    fontSize: height / 30,
                                  ),
                                ),
                                Text(
                                  '$acTemp°C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height / 30,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    child: Divider(),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.black.withOpacity(.8),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          acTemp--;
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.black.withOpacity(.8),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          acTemp++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: height / 4,
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.pinimg.com/736x/c3/9a/72/c39a72a101dec9f5d37727e17ed9ef0a.jpg'),
                                  fit: BoxFit.cover),
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
                            padding: const EdgeInsets.only(
                                left: 20, top: 10, right: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stateroomObjective[1],
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(.8),
                                    fontSize: height / 30,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    child: Divider(),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      curtainSwitch ? 'Open' : 'Close',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height / 15,
                                      ),
                                    ),
                                    IconButton(
                                      alignment: Alignment.bottomCenter,
                                      icon: Icon(
                                        curtainSwitch
                                            ? Icons.open_in_full
                                            : Icons.close_fullscreen,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          curtainSwitch = !curtainSwitch;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: height / 4,
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVbufQR5wfU4vNnORX3KB0AUDXuY7wpHG9lEfFqlVjRg&s'),
                                  fit: BoxFit.cover),
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
                            padding: const EdgeInsets.only(
                                left: 20, top: 10, right: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stateroomObjective[2],
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(.8),
                                    fontSize: height / 30,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    child: Divider(),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      lightOnOrOffToggle ? 'On' : 'Off',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height / 15,
                                      ),
                                    ),
                                    IconButton(
                                      alignment: Alignment.bottomCenter,
                                      icon: Icon(
                                        lightOnOrOffToggle
                                            ? Icons.lightbulb
                                            : Icons.lightbulb_outline,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          lightOnOrOffToggle =
                                              !lightOnOrOffToggle;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
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