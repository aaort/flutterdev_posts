import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/providers/theme_mode_provider.dart';
import 'package:flutterdev_posts/src/screens/home.dart';

void main() async => runApp(const ProviderScope(child: App()));

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(themeModeProvider).when(
          error: (_, __) => Container(),
          loading: () => Container(),
          data: (themeMode) => MaterialApp(
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            themeMode: themeMode,
            home: const Home(),
          ),
        );
  }
}
