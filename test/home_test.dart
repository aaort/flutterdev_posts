import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterdev_posts/main.dart';
import 'package:flutterdev_posts/src/models/post.dart';
import 'package:flutterdev_posts/src/providers/posts_provider.dart';
import 'package:flutterdev_posts/src/providers/theme_mode_provider.dart';
import 'package:flutterdev_posts/src/screens/home.dart';

class ThemeModeNotifierMock extends ThemeModeNotifier {
  @override
  FutureOr<ThemeMode> build() {
    return Future.value(ThemeMode.light);
  }
}

const _fakePost = Post(
  title: 'title',
  author: 'author',
  selftext: 'selftext',
  subreddit: 'subreddit',
  ups: 10,
);

void main() {
  testWidgets('Testing App', (tester) async {
    await tester.pumpWidget(ProviderScope(
      overrides: [
        themeModeProvider.overrideWith(() => ThemeModeNotifierMock()),
        postsProvider.overrideWith((ref) {
          return Future.value([_fakePost]);
        }),
      ],
      child: const App(),
    ));

    expect(find.byType(App), findsOneWidget);
  });
}
