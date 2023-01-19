import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterdev_posts/src/widgets/loading.dart';

class Thumbnail extends StatelessWidget {
  final String imageUrl;
  const Thumbnail({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const Loading(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: 100,
        width: 90,
        fit: BoxFit.fill,
      ),
    );
  }
}
