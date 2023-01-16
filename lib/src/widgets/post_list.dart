import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:flutterdev_posts/src/services/connectivity_provider.dart';
import 'package:flutterdev_posts/src/services/data_service.dart';
import 'package:flutterdev_posts/src/widgets/connectivity_info.dart';
import 'package:flutterdev_posts/src/widgets/post_card.dart';

class PostList extends ConsumerWidget {
  final List<Post> posts;
  const PostList({required this.posts, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(connectivityProvider);
    return RefreshIndicator(
      // Do not refresh if no not connected to the internet, show snackbar instead
      onRefresh: () async {
        if (!isConnected.hasValue) return;
        if (isConnected.value!) {
          ref.refresh(postsProvider);
        } else {
          showConnectivityInfo(
            context: context,
            isConnected: isConnected.value!,
          );
        }
      },

      child: ListView(
        padding: const EdgeInsets.all(10),
        children: posts.map((post) => PostCard(post: post)).toList(),
      ),
    );
  }
}
