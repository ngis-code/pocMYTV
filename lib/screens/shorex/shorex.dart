import 'package:flutter/material.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/screens/notification/rate_bar.dart';

class ShorexScreen extends StatefulWidget {
  static final List<Map<String, dynamic>> exsData = [
    {
      'title': 'Celebrity Sail & Snorkel',
      'rating': 4,
      'views': 738,
      'price': 134.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1593634805410-NC149C7M0QCJMMUMLJ3J/colors+01+copy+4.jpg?format=1500w',
    },
    {
      'title': 'Celebrity Shore Excursion',
      'rating': 3,
      'views': 387,
      'price': 400.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1594317631484-6JNSTCSQZWE8GASE1M5W/Ca_10.jpg?format=1500w',
    },
    {
      'title': 'Celebrity Dolphin Encounter',
      'rating': 3,
      'views': 3218,
      'price': 34.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1594320847160-DSJPBO63J6PLNCXXZ274/Ca_12.jpg?format=1500w',
    },
    {
      'title': 'Celebrity',
      'rating': 4.5,
      'views': 465,
      'price': 256.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/1594323275851-08KBXHEHN2F4SIOYUJNB/Ca_18.png?format=1500w',
    },
    {
      'title': 'Celebrity Dolphin Encounter',
      'rating': 3,
      'views': 328,
      'price': 134.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/4cd53c9c-585a-408e-accf-bff8dc024332/getty-images-IJOEYzY5sek-unsplash.jpg',
    },
    {
      'title': 'Celebrity Shore Excursion',
      'rating': 4.5,
      'views': 8672,
      'price': 123.99,
      'image':
          'https://images.squarespace-cdn.com/content/v1/5dd44fb4b648a6011c4f6394/2fcfb85b-6f9b-4271-b7b9-68a2ef424a38/Frame+460785.jpg?format=1500w',
    },
  ];
  const ShorexScreen({super.key});

  @override
  State<ShorexScreen> createState() => _ShorexScreenState();
}

class _ShorexScreenState extends State<ShorexScreen> {
  final highlightPageController = PageController();
  final allPageController = PageController();
  bool disposed = false;
  List<Map<String, dynamic>> get exsData => ShorexScreen.exsData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animate();
      _allPageAnimate();
    });
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundVideo(
        backgroundWidget: const SizedBox(),
        child: Column(
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
                                    initialRating: double.tryParse(
                                            data['rating'].toString()) ??
                                        0,
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
                                          initialRating: double.tryParse(
                                                  data['rating'].toString()) ??
                                              0,
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
      ),
    );
  }

  void _animate() {
    Future.delayed(const Duration(seconds: 5), () {
      if (disposed) return;
      highlightPageController.nextPage(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
      _animate();
    });
  }

  void _allPageAnimate() async {
    final width = MediaQuery.of(context).size.width / 4;
    if (disposed) return;
    await allPageController.animateTo(allPageController.offset + width,
        duration: const Duration(seconds: 4), curve: Curves.linear);
    _allPageAnimate();
  }
}
