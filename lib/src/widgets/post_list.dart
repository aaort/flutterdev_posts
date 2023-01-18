import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:flutterdev_posts/src/providers/connectivity_provider.dart';
import 'package:flutterdev_posts/src/providers/posts_provider.dart';
import 'package:flutterdev_posts/src/widgets/connectivity_info.dart';
import 'package:flutterdev_posts/src/widgets/post_card.dart';

class PostList extends ConsumerWidget {
  final List<Post> posts;
  const PostList({required this.posts, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      // Do not refresh if not connected to the internet, show snackbar instead
      onRefresh: () async {
        final isConnected = await ref.watch(isConnectedProvider.future);
        if (isConnected) ref.invalidate(postsProvider);
        if (!isConnected) {
          showConnectivityInfo(context: context, isConnected: isConnected);
        }
      },

      child: ListView(
        padding: const EdgeInsets.all(10),
        children: posts.map((post) => PostCard(post: post)).toList(),
      ),
    );
  }
}
