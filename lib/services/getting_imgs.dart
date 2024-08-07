import 'dart:math';

import 'package:flutter/material.dart';

Future<Image?> getIImage(BuildContext context, String imgUrl) async {
  Image? image;

  await Future.delayed(Duration(seconds: Random().nextInt(3)));

  image = Image.network(
    imgUrl,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) => const Text(
      'img unavailable',
      style: TextStyle(color: Colors.red),
    ),
  );

  return image;
}

displayImage(BuildContext context, String imgUrl) {
  return FutureBuilder<Image?>(
      future: getIImage(context, imgUrl),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox.shrink(
            child: snapshot.data,
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink(
              child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.connectionState == ConnectionState.none) {
          return const Text('Unable To Load Image');
        } else {
          return const Text('Unable To Load Image');
        }
      }));
}
