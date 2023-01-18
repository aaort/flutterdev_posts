import 'dart:async';

import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/services/cache.dart';

final themeModeProvider =
    AsyncNotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);

class ThemeModeNotifier extends AsyncNotifier<ThemeMode> {
  @override
  FutureOr<ThemeMode> build() {
    return Cache().getThemeMode();
  }

  void toggle() async {
    state = await AsyncValue.guard(() async {
      return state.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
    state.whenData((mode) => Cache().setThemeMode(mode));
  }
}
