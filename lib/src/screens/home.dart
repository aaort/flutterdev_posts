import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/services/connectivity_provider.dart';
import 'package:flutterdev_posts/src/services/data_service.dart';
import 'package:flutterdev_posts/src/widgets/connectivity_info.dart';
import 'package:flutterdev_posts/src/widgets/post_list.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsProvider);
    ref.listen(connectivityProvider, (_, isConnected) {
      if (!isConnected.hasValue) return;
      showConnectivityInfo(context: context, isConnected: isConnected.value!);
    });

    return Scaffold(
      body: postsAsyncValue.when(
        error: (_, __) => const Center(child: Text('Something went wrong')),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (posts) {
          if (posts == null) return Center(child: Text('Something went wrong'));
          return PostList(posts: posts);
        },
      ),
    );
  }
}
