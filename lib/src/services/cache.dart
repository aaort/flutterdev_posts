import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:hive/hive.dart' show Hive, Box;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

const _boxName = 'postsBox';
const _postsBoxKey = 'posts';
const _themeModeBoxName = 'themeModeBox';
const _themeModeBoxKey = 'isDark';

// Util for managing cached posts and theme mode
class Cache {
  /// Init box for posts if not already and return it opened
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
    postsBox.put(_postsBoxKey, mappedPosts);
  }

  /// Get cached posts if exist
  Future<List<Post>> getPosts() async {
    final postsBox = await _getPostsBox();
    final data = postsBox.get(_postsBoxKey) ?? [];
    final postMaps = List<Map>.from(data);
    final posts = List<Post>.from(postMaps.map(Post.fromMap));
    return posts;
  }

  /// Init box for theme mode and return it opened
  Future<Box> _getThemeBox() async {
    if (!kIsWeb && !Hive.isBoxOpen(_themeModeBoxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }

    return await Hive.openBox(_themeModeBoxName);
  }

  /// Cache theme mode
  void setThemeMode(ThemeMode themeMode) async {
    final themeBox = await _getThemeBox();
    await themeBox.put(_themeModeBoxKey, themeMode == ThemeMode.dark);
  }

  /// Get cached theme mode, return [ThemeMode.dark] if null
  Future<ThemeMode> getThemeMode() async {
    final isInDarkMode = (await _getThemeBox()).get(_themeModeBoxKey) as bool?;
    return isInDarkMode ?? true ? ThemeMode.dark : ThemeMode.light;
  }
}
