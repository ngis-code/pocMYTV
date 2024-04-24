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
            child: Row(
              children: [
                RoomServiceModel.roomServices.isEmpty
                    ? Container()
                    : SizedBox(
                        width: width / 4,
                        height: height,
                        child: Column(
                          children: [
                            const Text(
                              "Cart",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: RoomServiceModel.roomServices.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      RoomServiceModel
                                          .roomServices[index].title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "Price: \$${RoomServiceModel.roomServices[index].price}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    trailing: Text(
                                      "Qty: ${RoomServiceModel.roomServices[index].id}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height / 18,
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
                      Expanded(
                        child: ListView.builder(
                          itemCount: RoomServiceModel.roomServices.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width / 4,
                                child: FocusWidget(
                                  hasFocus: index == 0,
                                  focusGroup: 'roomServiceBttns',
                                  onTap: () {
                                    return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.transparent
                                              .withOpacity(0.8),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              FocusWidget(
                                                focusGroup:
                                                    'roomServicePopupBttns',
                                                hasFocus: true,
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: const Icon(
                                                  Icons.cancel,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      RoomServiceModel
                                                          .roomServices[index]
                                                          .image,
                                                      width: width / 5,
                                                      height: height / 3,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        RoomServiceModel
                                                            .roomServices[index]
                                                            .title,
                                                        style: TextStyle(
                                                          fontSize: height / 40,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                                .roomServices[
                                                                    index]
                                                                .rating,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemSize: 20,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        ratingWidget:
                                                            RatingWidget(
                                                          full: const Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber),
                                                          half: const Icon(
                                                              Icons.star_half,
                                                              color:
                                                                  Colors.amber),
                                                          empty: const Icon(
                                                              Icons.star_border,
                                                              color:
                                                                  Colors.amber),
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {},
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
                                                    focusGroup:
                                                        'roomServicePopupBttns',
                                                    onTap: () {
                                                      setState(() {
                                                        RoomServiceModel
                                                            .roomServices
                                                            .add(RoomServiceModel
                                                                    .roomServices[
                                                                index]);
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      "Add to Cart",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
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
                                    tag: RoomServiceModel
                                        .roomServices[index].title,
                                    child: GridTile(
                                      footer: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                          color: Colors.transparent
                                              .withOpacity(.5),
                                        ),
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
                                                  .roomServices[index]
                                                  .description,
                                              style: TextStyle(
                                                fontSize: height / 50,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Image.network(
                                          RoomServiceModel
                                              .roomServices[index].image,
                                          width: width / 4,
                                          height: height * 0.3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
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
                      Expanded(
                        child: ListView.builder(
                          itemCount: RoomServiceModel.roomServices.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width / 4,
                                child: FocusWidget(
                                  hasFocus: index == 0,
                                  focusGroup: 'roomServiceBttns',
                                  onTap: () {
                                    return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.transparent
                                              .withOpacity(0.8),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              FocusWidget(
                                                focusGroup:
                                                    'roomServicePopupBttns',
                                                hasFocus: true,
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: const Icon(
                                                  Icons.cancel,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      RoomServiceModel
                                                          .roomServices[index]
                                                          .image,
                                                      width: width / 5,
                                                      height: height / 3,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        RoomServiceModel
                                                            .roomServices[index]
                                                            .title,
                                                        style: TextStyle(
                                                          fontSize: height / 40,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                                .roomServices[
                                                                    index]
                                                                .rating,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemSize: 20,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        ratingWidget:
                                                            RatingWidget(
                                                          full: const Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber),
                                                          half: const Icon(
                                                              Icons.star_half,
                                                              color:
                                                                  Colors.amber),
                                                          empty: const Icon(
                                                              Icons.star_border,
                                                              color:
                                                                  Colors.amber),
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {},
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
                                                    focusGroup:
                                                        'roomServicePopupBttns',
                                                    onTap: () {
                                                      setState(() {
                                                        RoomServiceModel
                                                            .roomServices
                                                            .add(RoomServiceModel
                                                                    .roomServices[
                                                                index]);
                                                      });
                                                    },
                                                    child: const Text(
                                                      "Add to Cart",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
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
                                    tag: RoomServiceModel
                                        .roomServices[index].title,
                                    child: GridTile(
                                      footer: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                          color: Colors.transparent
                                              .withOpacity(.5),
                                        ),
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
                                                  .roomServices[index]
                                                  .description,
                                              style: TextStyle(
                                                fontSize: height / 50,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Image.network(
                                          RoomServiceModel
                                              .roomServices[index].image,
                                          width: width / 4,
                                          height: height * 0.3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
