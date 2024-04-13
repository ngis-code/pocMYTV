import 'package:flutter/material.dart';
import 'package:pocmytv/screens/notification/rate_bar.dart';

class ShorexScreen extends StatefulWidget {
  const ShorexScreen({super.key});

  @override
  State<ShorexScreen> createState() => _ShorexScreenState();
}

class _ShorexScreenState extends State<ShorexScreen> {
  final highlightPageController = PageController();
  final allPageController = PageController();
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
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Wrap(
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
            child: LayoutBuilder(builder: (context, constraints) {
              final width = constraints.maxWidth / 4;
              return ListView.builder(
                controller: allPageController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  index = index % exsData.length;
                  final data = exsData[index];
                  return SizedBox(
                    width: width,
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.network(
                              data['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ShoreExcursions",
                                  maxLines: 2,
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
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Wrap(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: RateBar(
                                        initialRating: data['rating'],
                                        size: 20,
                                        color: Colors.blue,
                                      ),
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
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _animate() {
    Future.delayed(const Duration(seconds: 5), () {
      highlightPageController.nextPage(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
      _animate();
    });
  }
}
