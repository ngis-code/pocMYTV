import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/screens/safety/safety_image.dart';
import 'package:pocmytv/screens/safety/safety_video.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:pocmytv/widgets/drawer.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  final player = AudioPlayer();

  Future<void> playAudioFromUrl(String url) async {
    await player.play(
      UrlSource(url),
    );
  }

  Color buttonColor = Colors.grey;
  Color hornColor = Colors.grey;
  Color safetyColor = Colors.grey;

  bool _isButton2Active = false;
  bool _isButton3Active = false;

  void videoCompleted() {
    setState(() {
      buttonColor = Colors.green;
      _isButton2Active = true;
    });
  }

  hornColorChange() async {
    player.onDurationChanged.listen((event) async {
      if (event.inSeconds == (await player.getDuration())!.inSeconds) {
        safetyColorChange();
      }
    });
    setState(() {
      hornColor = Colors.green;
      _isButton3Active = true;
    });
    TVDrawer.safetyLocked.value = false;
  }

  safetyColorChange() {
    setState(() {
      safetyColor = Colors.green;
    });
  }

  @override
  void initState() {
    super.initState();
    _isButton2Active = !TVDrawer.safetyLocked.value;
    _isButton3Active = !TVDrawer.safetyLocked.value;
    if (!TVDrawer.safetyLocked.value) {
      buttonColor = Colors.green;
      hornColor = Colors.green;
      safetyColor = Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final child = Scaffold(
      backgroundColor: Colors.transparent,
      body: BackgroundVideo(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Safety Information',
                    style: TextStyle(
                      fontSize: height / 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.5),
                    child: Text(
                      'Safety is our top priority. We are committed to providing a safe environment for our employees, customers, and communities.',
                      style: TextStyle(
                        fontSize: height / 30,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 5,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: GlassWidget(
                            padding: const EdgeInsets.all(10),
                            radius: 20,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      'https://mytvpocroyal.com/uploads/lifejacket_img',
                                      height: height / 3,
                                      width: width / 4,
                                    ),
                                  ),
                                  const Text(
                                    'Life Jacket Tutorial',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.blue),
                                  ),
                                  const Text(
                                    'Learn how to wear a life jacket properly',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Material(
                                    elevation: 10,
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                    child: FocusWidget(
                                      hasFocus: true,
                                      borderColor: Colors.grey.withOpacity(0.5),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SafetyVideoScreen(
                                              onVideoCompleted: videoCompleted,
                                            ),
                                          ),
                                        );
                                      },
                                      // This
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        child: Text(
                                          'Watch the Tutorial'.toUpperCase(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: _isButton2Active
                            ? Material(
                                elevation: 5,
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                child: GlassWidget(
                                  padding: const EdgeInsets.all(10),
                                  radius: 20,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            'https://mytvpocroyal.com/uploads/lifejacket_img',
                                            height: height / 3,
                                            width: width / 4,
                                          ),
                                        ),
                                        const Text(
                                          'Emergency horn',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.blue),
                                        ),
                                        const Text(
                                          'In an emergency the captain will\nsound seven short and one long emergency blast',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Material(
                                          elevation: 10,
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: FocusWidget(
                                            borderColor:
                                                Colors.grey.withOpacity(0.5),
                                            onTap: () async {
                                              try {
                                                await playAudioFromUrl(
                                                    "https://mytvpocroyal.com/uploads/LATEST_Emergency%20Signal.mp3");
                                              } catch (e) {
                                                log("Error playing audio: $e");
                                                log("Moving onto next");
                                              }
                                              hornColorChange();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: hornColor,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 10),
                                              child: Text(
                                                'play horn sound'.toUpperCase(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Stack(
                                children: [
                                  GlassWidget(
                                    // padding: const EdgeInsets.all(10),
                                    radius: 20,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              'https://mytvpocroyal.com/uploads/lifejacket_img',
                                              height: height / 3,
                                              width: width / 4,
                                            ),
                                          ),
                                          const Text(
                                            'Emergency horn',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.blue),
                                          ),
                                          const Text(
                                            'In an emergency the captain will\nsound seven short and one long emergency blast',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            child: Text(
                                              'play horn sound'.toUpperCase(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                      child: GlassWidget(
                                    blur: 1,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.5),
                                    radius: 20,
                                    child: Container(),
                                  ))
                                ],
                              ),
                      ),
                      Expanded(
                          child: _isButton3Active
                              ? Material(
                                  elevation: 5,
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                  child: GlassWidget(
                                    padding: const EdgeInsets.all(10),
                                    radius: 20,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.network(
                                            'https://mytvpocroyal.com/uploads/IC_sign_B2.png',
                                          ),
                                          const Text(
                                            'Your assembly station',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.blue),
                                          ),
                                          const Text(
                                            'Go directly to your assembly\nstation if you hear the emergency horn',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Material(
                                            elevation: 10,
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: FocusWidget(
                                              borderColor:
                                                  Colors.grey.withOpacity(0.5),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SafetyImage(),
                                                  ),
                                                );
                                                safetyColorChange();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: safetyColor,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                child: Text(
                                                  'find your station'
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Stack(
                                  children: [
                                    GlassWidget(
                                      // padding: const EdgeInsets.all(10),
                                      radius: 20,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.network(
                                              'https://mytvpocroyal.com/uploads/IC_sign_B2.png',
                                            ),
                                            const Text(
                                              'Your assembly station',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.blue),
                                            ),
                                            const Text(
                                              'Go directly to your assembly\nstation if you hear the emergency horn',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 10),
                                              child: Text(
                                                'find your station'
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                        child: GlassWidget(
                                      blur: 1,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.5),
                                      radius: 20,
                                      child: Container(),
                                    ))
                                  ],
                                )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    return child;
  }
}
