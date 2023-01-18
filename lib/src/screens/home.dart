import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/providers/connectivity_provider.dart';
import 'package:flutterdev_posts/src/providers/posts_provider.dart';
import 'package:flutterdev_posts/src/widgets/connectivity_info.dart';
import 'package:flutterdev_posts/src/widgets/post_list.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(connectivityProvider, (_, connected) {
      connected.mapOrNull(data: (isConnected) {
        ref.invalidate(postsProvider);
        showConnectivityInfo(
          context: context,
          isConnected: isConnected.value,
        );
      });
    });

    return Scaffold(
      appBar: AppBar(title: const Text('r/FlutterDev')),
      body: ref.watch(postsProvider).when(
            error: (_, __) => const Center(child: Text('Something went wrong')),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (posts) => PostList(posts: posts ?? []),
          ),
    );
  }
}
