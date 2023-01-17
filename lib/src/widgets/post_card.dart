import 'package:flutter/material.dart';
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:flutterdev_posts/src/screens/post_details.dart';
import 'package:flutterdev_posts/src/widgets/thumbnail.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({required this.post, super.key});

  onNavigateToDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PostDetails(post: post),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final thumbnail = post.thumbnail;
    return InkWell(
      onTap: () => onNavigateToDetails(context),
      child: Card(
        elevation: 5,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 80),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Posted by u/${post.author}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                Text(post.title),
              ],
            ),
            trailing: thumbnail != null && thumbnail.startsWith('http')
                ? Thumbnail(imageUrl: thumbnail)
                : null,
          ),
        ),
      ),
    );
  }
}
