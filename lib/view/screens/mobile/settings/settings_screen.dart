import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hola/controller/settings/riverpod.dart';

class ScreenSettings extends ConsumerWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSwitch = ref.watch(themeSwitchProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListTile(
        leading: Icon(themeSwitch ?Icons.light_mode_outlined:Icons.nights_stay_outlined), 
        title: Text(themeSwitch ? 'Light Mode' : 'Dark Mode'),
        trailing: Switch(
          value: themeSwitch,
          onChanged: (value) =>
              ref.read(themeSwitchProvider.notifier).state = value,
        ),
      ),
    );
  }
}
