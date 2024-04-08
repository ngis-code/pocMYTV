import 'dart:developer';

import 'package:flutter/material.dart';

class PreLoader {
  static const Set<String> assetImages = {
    'assets/images/logo.png',
    'assets/images/qrcode.png',
    'assets/images/ship_info.webp',
    'assets/ship.png',
  };
  static const Set<String> networkImages = {
    "https://i.pinimg.com/originals/17/0a/b5/170ab5775a7c96125e70638942e2f513.png",
    "https://as1.ftcdn.net/v2/jpg/02/77/84/54/1000_F_277845419_KGENqAUJ1JsiK4e7tNc5N8i1z5fRRwEb.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/016/314/482/small/map-pointer-art-icons-and-graphics-free-png.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmLxUqyCxVBJlR-nxuMCpe2TT1tF17h_NNCR8cqhpVxw&s",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/FOX_wordmark-orange.svg/1200px-FOX_wordmark-orange.svg.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/MTV_International_2009.svg/1200px-MTV_International_2009.svg.png",
    "https://deeplink.recruitpick.com/uploads/action-shot-with-man-on-the-run-dynamic-scene-in-action-movie-blockbuster-style-generated-ai-photo.webp",
    "https://deeplink.recruitpick.com/uploads/adventure_movie_scene_epic_drama_4_by_dankushagi_dfx68wh-pre.webp",
    "https://deeplink.recruitpick.com/uploads/image%20(1).webp",
    "https://deeplink.recruitpick.com/uploads/home-alone-1585876454.webp",
    "https://deeplink.recruitpick.com/uploads/AAAABWHNRq64uL28xpbVQlXquunYU3GY_iTiHAXem5T9dfKAHzuTDPJvBJiyZualhrTBuLucgTG912wMDRquH60r23h_8XQivAQmaNMTeGBcwVEKG9OnhVqcnxKM.webp",
    "https://deeplink.recruitpick.com/uploads/eb01187bbe4c8a3d9a677ae85b32143c2763438a_2000x2000%20(1).webp",
    "https://deeplink.recruitpick.com/uploads/Family-2013-1.webp",
    "https://deeplink.recruitpick.com/uploads/best-fantasy-movies.webp",
    "https://deeplink.recruitpick.com/uploads/saving-private-ryan.webp",
    "https://deeplink.recruitpick.com/uploads/Reddit-Scariest-Horror-Movie-Scenes-Featured-Image.webp",
    "https://deeplink.recruitpick.com/uploads/back-to-the-future.webp",
    "https://deeplink.recruitpick.com/uploads/MCDKNOU_LG002%20(1).webp",
    "https://i.pinimg.com/236x/1f/d3/da/1fd3dabcfe549266176e365d830baaea.jpg",
    "https://static1.srcdn.com/wordpress/wp-content/uploads/2023/04/2001-best-sci-fi-movie-scenes-matrix.jpg?q=50&fit=contain&w=1140&h=&dpr=1.5",
    "https://media.thenerdstash.com/wp-content/uploads/2021/11/thriller-films-feature-image.jpg.webp",
    "https://assets-prd.ignimgs.com/2022/06/17/best-thriller-thumbnail-1655499110276.jpg",
    "https://d3dh6of9cnaq4t.cloudfront.net/Pictures/2000x1125/4/5/0/17450_tomorrowwar_873634.jpg",
    "https://i0.wp.com/saportareport.com/wp-content/uploads/2021/12/scene-fron-power-of-the-dog.featured.jpeg?w=1200&ssl=1",
    "https://www.cruisehive.com/wp-content/uploads/2023/12/cococay1.jpg",
    'https://deeplink.recruitpick.com/uploads/lifejacket_img',
    "https://deeplink.recruitpick.com/uploads/LATEST_Emergency%20Signal.mp3",
    'https://deeplink.recruitpick.com/uploads/IC_sign_B2.png',
  };
  static final ValueNotifier<double> loaded = ValueNotifier(0);

  static Future<void> load(BuildContext context) async {
    loaded.value = 0;
    final List<Future> futures = [];
    for (final assetImage in assetImages) {
      futures.add(
        precacheImage(
          AssetImage(assetImage),
          context,
          onError: (exception, stackTrace) =>
              log("$exception", name: "PreLoader.load"),
        ).then(
          (value) =>
              loaded.value += 1 / (assetImages.length + networkImages.length),
        ),
      );
      loaded.value += 1 / (assetImages.length + networkImages.length);
    }
    for (final networkImage in networkImages) {
      futures.add(
        precacheImage(
          NetworkImage(networkImage),
          context,
          onError: (exception, stackTrace) =>
              log("$exception", name: "PreLoader.load"),
        ).then(
          (value) =>
              loaded.value += 1 / (assetImages.length + networkImages.length),
        ),
      );
    }
    await Future.wait(futures);
    loaded.value = 1;
  }
}
