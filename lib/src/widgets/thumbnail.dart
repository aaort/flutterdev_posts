import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final String imageUrl;
  const Thumbnail({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      height: 100,
      fit: BoxFit.fill,
    );
  }
}
