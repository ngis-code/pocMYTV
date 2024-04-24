import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';

import 'room_model.dart';

class RoomService extends StatefulWidget {
  const RoomService({super.key});

  @override
  State<RoomService> createState() => _RoomServiceState();
}

class _RoomServiceState extends State<RoomService> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BackgroundVideo(
        backgroundWidget: Container(),
        child: BubbleAnimation(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 20,
                ),
                const Text("Room Service",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(
                  height: height / 20,
                ),
                Text("Recommended",
                    style: TextStyle(
                        fontSize: height / 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(
                  height: height * 0.3,
                  child: ListView.builder(
                    itemCount: RoomServiceModel.roomServices.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: height * 0.3,
                          width: width / 4,
                          child: FocusWidget(
                            onTap: () {
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor:
                                        Colors.transparent.withOpacity(0.8),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        FocusWidget(
                                          onTap: () => Navigator.pop(context),
                                          child: const Icon(
                                            Icons.cancel,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                RoomServiceModel
                                                    .roomServices[index].image,
                                                width: width / 5,
                                                height: height / 3,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  RoomServiceModel
                                                      .roomServices[index]
                                                      .title,
                                                  style: TextStyle(
                                                    fontSize: height / 40,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  RoomServiceModel
                                                      .roomServices[index]
                                                      .description,
                                                  style: TextStyle(
                                                    fontSize: height / 50,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Price: \$${RoomServiceModel.roomServices[index].price}",
                                                  style: TextStyle(
                                                    fontSize: height / 50,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                RatingBar(
                                                  initialRating:
                                                      RoomServiceModel
                                                          .roomServices[index]
                                                          .rating,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 20,
                                                  itemPadding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 4.0),
                                                  ratingWidget: RatingWidget(
                                                    full: const Icon(Icons.star,
                                                        color: Colors.amber),
                                                    half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.amber),
                                                    empty: const Icon(
                                                        Icons.star_border,
                                                        color: Colors.amber),
                                                  ),
                                                  onRatingUpdate: (rating) {},
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FocusWidget(
                                              onTap: () {},
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child:
                                                    const Text("Add to Cart"),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Hero(
                              tag: RoomServiceModel.roomServices[index].title,
                              child: GridTile(
                                footer: Container(
                                  color: Colors.transparent.withOpacity(.5),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        RoomServiceModel
                                            .roomServices[index].title,
                                        style: TextStyle(
                                          fontSize: height / 40,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        RoomServiceModel
                                            .roomServices[index].description,
                                        style: TextStyle(
                                          fontSize: height / 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                header: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    RoomServiceModel.roomServices[index].image,
                                    width: width / 4,
                                    height: height * 0.3,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: const SizedBox(),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Snacks",
                  style: TextStyle(
                    fontSize: height / 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: height * 0.3,
                  child: ListView.builder(
                    itemCount: RoomServiceModel.roomServices.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: height * 0.3,
                          width: width / 4,
                          child: FocusWidget(
                            onTap: () {},
                            child: Hero(
                              tag: RoomServiceModel.roomServices[index].title,
                              child: GridTile(
                                footer: Container(
                                  color: Colors.transparent.withOpacity(.5),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        RoomServiceModel
                                            .roomServices[index].title,
                                        style: TextStyle(
                                          fontSize: height / 40,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        RoomServiceModel
                                            .roomServices[index].description,
                                        style: TextStyle(
                                          fontSize: height / 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                header: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    RoomServiceModel.roomServices[index].image,
                                    width: width / 4,
                                    height: height * 0.3,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: const SizedBox(),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
