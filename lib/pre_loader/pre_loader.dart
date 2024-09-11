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
          onError: (exception, stackTrace) => log(
              "AssetImage($assetImage): $exception",
              name: "PreLoader.load"),
        ).then(
          (value) =>
              loaded.value += 1 / (assetImages.length + networkImages.length),
        ),
      );
    }
    for (final networkImage in networkImages) {
      futures.add(
        precacheImage(
          NetworkImage(networkImage),
          context,
          onError: (exception, stackTrace) => log(
              "NetworkImage($networkImage): $exception",
              name: "PreLoader.load"),
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
