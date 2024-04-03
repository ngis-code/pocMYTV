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
      bubbles: 5,
      child: DrawerRow(
        focusedItem: 1,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Safety',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Safety is our top priority. We are committed to providing a safe environment for our employees, customers, and communities.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: GlassWidget(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Column(
                        children: [
                          const Text(
                            'Life Jacket Tutorial',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            'Learn how to wear a life jacket properly',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Watch Tutorial'),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
