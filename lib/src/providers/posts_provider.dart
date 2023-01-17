import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:flutterdev_posts/src/providers/data_service_provider.dart';
import 'package:flutterdev_posts/src/services/cache.dart';
import 'package:flutterdev_posts/src/providers/connectivity_provider.dart';

final postsProvider = FutureProvider<List<Post>?>((ref) async {
  final isConnectedAsyncValue = ref.watch(connectivityProvider);
  final cache = ref.watch(cacheProvider);
  final isConnected = isConnectedAsyncValue.value;
  // If internet connection exists fetch the data
  if (isConnected == null) return [];
  if (!isConnected) return await cache.getPosts();
  if (isConnected) {
    final dataService = ref.watch(dataServiceProvider);
    final posts = await dataService.getPosts();
    if (posts == null) return null;
    // Update cached data
    cache.setPosts(posts);
    return posts;
  }
});
