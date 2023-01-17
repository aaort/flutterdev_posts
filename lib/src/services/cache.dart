import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:hive/hive.dart' show Hive, Box;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

final cacheProvider = Provider((ref) => Cache());

const _boxName = 'posts';

// Util for caching data
class Cache {
  /// Init Hive database if not already and returns opened box
  Future<Box> _getPostsBox() async {
    if (!kIsWeb && !Hive.isBoxOpen(_boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }

    return await Hive.openBox(_boxName);
  }

  /// Cache posts
  void setPosts(List<Post> posts) async {
    final postsBox = await _getPostsBox();
    final mappedPosts = posts.map((post) => post.toMap()).toList();
    postsBox.put('data', mappedPosts);
  }

  /// Get cached posts if exist
  Future<List<Post>> getPosts() async {
    final postsBox = await _getPostsBox();
    final data = postsBox.get('data') ?? [];
    final postMaps = List<Map>.from(data);
    final posts = List<Post>.from(postMaps.map(Post.fromMap));
    return posts;
  }
}
