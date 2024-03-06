import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hola/controller/settings/riverpod_states.dart';

class ScreenSettings extends ConsumerWidget { 
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListTile(
        title: const Text('Change Theme'),
        trailing: Switch(
          value: ref.watch(switchController).isSwitch,
          onChanged: (value) =>ref.read(switchController).switchTheme(), 
        ),
      ),
    );
  }
}
