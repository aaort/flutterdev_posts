import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider((ref) => 1);

class ThemeSwitchButton extends ConsumerWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(numberProvider);
    return GestureDetector(
      onTap: () {
        ref
            .read(numberProvider.notifier)
            .update((state) => state == 1 ? state = 2 : 1);
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, anim) => RotationTransition(
          turns: child.key == const ValueKey('dark_key')
              ? Tween<double>(begin: 1, end: 0.75).animate(anim)
              : Tween<double>(begin: 0.75, end: 1).animate(anim),
          child: ScaleTransition(scale: anim, child: child),
        ),
        child: number == 2 ? _darkIcon : _lightIcon,
      ),
    );
  }
}

const _darkIcon = Icon(Icons.dark_mode, key: ValueKey('dark_key'));
const _lightIcon = Icon(Icons.light_mode, key: ValueKey('light_key'));
