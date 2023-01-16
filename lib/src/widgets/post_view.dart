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
            trailing:
                post.thumbnail != null && post.thumbnail!.startsWith('https')
                    ? SizedBox(
                        // height: 200,
                        // width: 200,
                        child: Image.network(
                          post.thumbnail!,
                          height: 100,
                          scale: 1,
                          fit: BoxFit.fill,
                        ),
                      )
                    : null,
          ),
        ),
      ),
    );
  }
}
