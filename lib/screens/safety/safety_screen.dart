import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/safety/safety_video.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  final player = AudioPlayer();

  Future<void> playAudioFromUrl(String url) async {
    await player.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Safety Information',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Safety is our top priority. We are committed to providing a safe environment for our employees, customers, and communities.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Expanded(
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://deeplink.recruitpick.com/uploads/lifejacket_img',
                            ),
                          ),
                          const Text(
                            'Life Jacket Tutorial',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
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
                          FocusWidget(
                            borderColor: Colors.black,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SafetyVideoScreen(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
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
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://deeplink.recruitpick.com/uploads/lifejacket_img',
                            ),
                          ),
                          const Text(
                            'Emergency horn',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                          const Text(
                            'In an emergency the captain will sound seven short and one long emergency blast',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          FocusWidget(
                            borderColor: Colors.black,
                            onTap: () async {
                              await playAudioFromUrl(
                                  "https://deeplink.recruitpick.com/uploads/LATEST_Emergency%20Signal.mp3");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                              'https://deeplink.recruitpick.com/uploads/IC_sign_B2.png'),
                          const Text(
                            'Your assembly station',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                          const Text(
                            'Go directly to your assembly station if you hear the emergency horn',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          FocusWidget(
                            borderColor: Colors.black,
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'find your station'.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
