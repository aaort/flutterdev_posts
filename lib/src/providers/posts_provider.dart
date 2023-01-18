import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:flutterdev_posts/src/providers/cache_provider.dart';
import 'package:flutterdev_posts/src/providers/posts_service_provider.dart';

final postsProvider = FutureProvider<List<Post>?>((ref) async {
  final connectivityValue = await Connectivity().checkConnectivity();
  final isConnected = connectivityValue != ConnectivityResult.none;
  final cache = ref.watch(cacheProvider);
  if (isConnected) {
    final posts = await ref.watch(postsServiceProvider).getPosts();
    cache.setPosts(posts ?? []);
    return posts;
  }
  return await cache.getPosts();
});
