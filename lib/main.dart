import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hola/view/screens/home_screen.dart';
import 'package:hola/view/screens/settings/settings_screen.dart';
import 'package:hola/view/utils/themes/dark_mode.dart';
import 'package:hola/view/utils/themes/light_mode.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hola Chat',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/': (context) => const ScreenHome(),
        'settings': (context) => const ScreenSettings()
      },
      initialRoute: '/',
    );
  }
}
