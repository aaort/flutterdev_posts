import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:flutterdev_posts/src/screens/post_details.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({required this.post, super.key});

  onNavigateToDetails(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PostDetails(post: post)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onNavigateToDetails(context),
      child: Card(
        elevation: 5,
        child: Container(
          constraints: const BoxConstraints(minHeight: 80),
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Posted by u/${post.author}'),
                const SizedBox(height: 10),
                Text(post.title),
              ],
            ),
            trailing: _trailing(),
          ),
        ),
      ),
    );
  }

  Widget? _trailing() {
    final thumbnail = post.thumbnail;
    // Show thumbnail only if not null and start with http
    if (thumbnail != null && thumbnail.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: thumbnail,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: 100,
        fit: BoxFit.fill,
      );
    } else {
      return null;
    }
  }
}
