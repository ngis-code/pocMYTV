import 'package:flutter/material.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/utils/glass_widget.dart';
import 'package:pocmytv/widgets/drawer_row.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BubbleAnimation(
      colors: const [
        Colors.white,
      ],
      bubbles: 10,
      minRadius: 10,
      maxRadius: 20,
      velocityMultiplier: 4,
      child: DrawerRow(
        focusedItem: 1,
        child: Center(
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
                        // backgroundColor: Colors.white,
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
                              const Placeholder(
                                fallbackHeight: 400,
                                fallbackWidth: 200,
                              ),
                              const Text(
                                'Life Jacket Tutorial',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.blue),
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
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(1),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Watch the Tutorial'.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: GlassWidget(
                        padding: EdgeInsets.all(10),
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Column(
                          children: [
                            Text(
                              'Life Jacket Tutorial',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: GlassWidget(
                        padding: EdgeInsets.all(10),
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Column(
                          children: [
                            Text(
                              'Life Jacket Tutorial',
                              style: TextStyle(
                                fontSize: 20,
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
          ),
        ),
      ),
    );
  }
}
