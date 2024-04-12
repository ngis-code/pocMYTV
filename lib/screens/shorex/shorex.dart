import 'package:flutter/material.dart';
import 'package:pocmytv/screens/notification/rate_bar.dart';

class ShorexScreen extends StatefulWidget {
  const ShorexScreen({super.key});

  @override
  State<ShorexScreen> createState() => _ShorexScreenState();
}

class _ShorexScreenState extends State<ShorexScreen> {
  final highlightPageController = PageController();
  final List<Map<String, dynamic>> exsData = [
    {
      'title': 'Catamaran Sail & Snorkel',
      'rating': 4.5,
      'views': 738,
      'price': 134.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1593634805410-NC149C7M0QCJMMUMLJ3J/colors+01+copy+4.jpg?format=1500w',
    },
    {
      'title': 'Dolphin Encounter',
      'rating': 4.5,
      'views': 738,
      'price': 134.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1593634805410-NC149C7M0QCJMMUMLJ3J/colors+01+copy+4.jpg?format=1500w',
    },
    {
      'title': 'Dolphin Encounter',
      'rating': 4.5,
      'views': 738,
      'price': 134.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1593634805410-NC149C7M0QCJMMUMLJ3J/colors+01+copy+4.jpg?format=1500w',
    },
    {
      'title': 'Dolphin Encounter',
      'rating': 4.5,
      'views': 738,
      'price': 134.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1593634805410-NC149C7M0QCJMMUMLJ3J/colors+01+copy+4.jpg?format=1500w',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: highlightPageController,
              itemBuilder: (context, index) {
                index = index % exsData.length;
                final data = exsData[index];
                return Row(
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Image.network(
                        data['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            data['title'],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const RateBar(size: 20),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
