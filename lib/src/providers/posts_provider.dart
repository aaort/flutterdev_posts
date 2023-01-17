import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:flutterdev_posts/src/providers/posts_service_provider.dart';
import 'package:flutterdev_posts/src/providers/cache_provider.dart';
import 'package:flutterdev_posts/src/providers/connectivity_provider.dart';

final postsProvider = FutureProvider<List<Post>?>((ref) async {
  final isConnectedAsyncValue = ref.watch(connectivityProvider);
  final isConnected = isConnectedAsyncValue.value;
  if (isConnected == null) return [];
  final cache = ref.watch(cacheProvider);
  // If no internet connection return cached data
  if (!isConnected) return await cache.getPosts();
  // If internet connection exists fetch the data
  if (isConnected) {
    final dataService = ref.watch(postsServiceProvider);
    final posts = await dataService.getPosts();
    if (posts == null) return null;
    // Update cached data
    cache.setPosts(posts);
    return posts;
  }
  return [];
});
