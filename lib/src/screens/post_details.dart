import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:flutterdev_posts/src/widgets/post_launcher.dart';
import 'package:flutterdev_posts/src/widgets/thumbnail.dart';

class PostDetails extends StatelessWidget {
  final Post post;
  const PostDetails({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    final thumbnail = post.thumbnail;
    return Scaffold(
      appBar: AppBar(
        title: Text(post.subreddit),
        actions: [PostLauncher(permalink: post.permalink)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.arrow_upward_rounded),
                Text('${post.ups}')
              ],
            ),
            const SizedBox(width: 20),
            Flexible(
              flex: 7,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Markdown(
                      padding: EdgeInsets.zero,
                      data: post.selftext,
                    ),
                  ),
                ],
              ),
            ),
            if (thumbnail != null && thumbnail.startsWith('https'))
              Align(
                alignment: Alignment.topRight,
                child: Thumbnail(imageUrl: thumbnail),
              )
          ],
        ),
      ),
    );
  }
}
