import 'dart:convert' show jsonDecode;

import 'package:flutterdev_posts/src/models/post.dart';
import 'package:http/http.dart' as http;

const _url = 'https://reddit.com/r/flutterdev/new.json';

class Posts {
  Future<List<Post>?> getPosts() async {
    final response = await http.get(Uri.parse(_url));
    final posts = jsonDecode(response.body)['data']['children'] as List;
    final result = <Post>[];
    for (Map element in posts) {
      result.add(Post.fromMap(element['data'] as Map<String, dynamic>));
    }

    return result;
  }
}
