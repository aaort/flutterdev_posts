import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdev_posts/src/providers/theme_mode_provider.dart';

class ThemeSwitchButton extends ConsumerWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          // TODO: can be transformed into one line
          ref.read(themeModeProvider.notifier).toggle();
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          transitionBuilder: (child, anim) => RotationTransition(
            turns: child.key == const ValueKey('dark_key')
                ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                : Tween<double>(begin: 0.75, end: 1).animate(anim),
            child: ScaleTransition(scale: anim, child: child),
          ),
          child: themeMode.value == ThemeMode.dark ? _lightIcon : _darkIcon,
        ),
      ),
    );
  }
}

const _darkIcon = Icon(Icons.dark_mode, key: ValueKey('dark_key'));
const _lightIcon = Icon(Icons.light_mode, key: ValueKey('light_key'));
