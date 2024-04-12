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
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1594317631484-6JNSTCSQZWE8GASE1M5W/Ca_10.jpg?format=1500w',
    },
    {
      'title': 'Dolphin Encounter',
      'rating': 4.5,
      'views': 738,
      'price': 134.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1594320847160-DSJPBO63J6PLNCXXZ274/Ca_12.jpg?format=1500w',
    },
    {
      'title': 'Dolphin Encounter',
      'rating': 4.5,
      'views': 738,
      'price': 134.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/4cd53c9c-585a-408e-accf-bff8dc024332/getty-images-IJOEYzY5sek-unsplash.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _animate();
  }

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
                      child: SizedBox(
                        height: double.infinity,
                        child: Image.network(
                          data['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ShoreExcursions",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                            ),
                            Text(
                              data['title'],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Row(
                              children: [
                                RateBar(
                                  initialRating: data['rating'],
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                Text("${data['views']} reviews"),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "\$${data['price']}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: exsData.length,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                index = index % exsData.length;
                final data = exsData[index];
                return Column(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(
                        height: double.infinity,
                        child: Image.network(
                          data['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ShoreExcursions",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                            ),
                            Text(
                              data['title'],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Row(
                              children: [
                                RateBar(
                                  initialRating: data['rating'],
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                Text("${data['views']} reviews"),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "\$${data['price']}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

  void _animate() {
    Future.delayed(const Duration(seconds: 5), () {
      highlightPageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _animate();
    });
  }
}
