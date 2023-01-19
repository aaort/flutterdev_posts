import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:flutterdev_posts/src/services/cache.dart';

final cacheProvider = Provider<Cache>((ref) => Cache());
