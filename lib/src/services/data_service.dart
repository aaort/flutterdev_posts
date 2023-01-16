import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/models/post.dart';

const _url = 'https://reddit.com/r/flutterdev/new.json';

final postsProvider =
    FutureProvider<List<Post>?>((ref) => DataService().getPosts());

class DataService {
  static final _dio = Dio();

  DataService() {
    _dio.interceptors.add(DioCacheManager(
            CacheConfig(baseUrl: 'https://reddit.com/r/flutterdev/new.json'))
        .interceptor);
  }

  Future<List<Post>?> getPosts({int page = 25}) async {
    // _dio.options.headers['Authorization'] = basicAuth;
    final response = await _dio.get(_url,
        options: buildCacheOptions(const Duration(days: 7)));
    final posts = response.data['data']['children'] as List;
    final result = <Post>[];
    for (Map element in posts) {
      result.add(Post.fromMap(element['data'] as Map<String, dynamic>));
    }
    return result;
  }
}
