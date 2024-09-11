import 'dart:async';

import 'package:flutter/material.dart';

Future<Size> calculateImageDimension(String url) {
  Completer<Size> completer = Completer();
  Image image = Image.asset(url);
  image.image.resolve(const ImageConfiguration()).addListener(
    ImageStreamListener(
      (ImageInfo image, bool synchronousCall) {
        var myImage = image.image;
        Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
        completer.complete(size);
      },
    ),
  );
  return completer.future;
}
