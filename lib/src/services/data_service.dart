import 'dart:convert' show jsonDecode;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:flutterdev_posts/src/services/cache.dart';
import 'package:flutterdev_posts/src/services/connectivity_provider.dart';
import 'package:http/http.dart' as http;

const _url = 'https://reddit.com/r/flutterdev/new.json';

class DataService {
  Future<List<Post>?> getPosts({int page = 25}) async {
    // _dio.options.headers['Authorization'] = basicAuth;
    final response = await http.get(Uri.parse(_url));
    final posts = jsonDecode(response.body)['data']['children'] as List;
    final result = <Post>[];
    for (Map element in posts) {
      result.add(Post.fromMap(element['data'] as Map<String, dynamic>));
    }

    return result;
  }
}

final dataServiceProvider = Provider((ref) => DataService());
