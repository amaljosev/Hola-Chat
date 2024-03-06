import 'package:flutter/material.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListTile(
        title: const Text('Change Theme'),
        trailing: Switch(
          value: true,
          onChanged: (value) {},
        ),
      ),
    );
  }
}