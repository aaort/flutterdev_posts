import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:flutterdev_posts/src/services/posts.dart';

final dataServiceProvider = Provider((ref) => Posts());
