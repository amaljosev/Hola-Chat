import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hola/controller/settings/riverpod_states.dart';
import 'package:hola/view/screens/home_screen.dart';
import 'package:hola/view/screens/login/login.dart';
import 'package:hola/view/screens/settings/settings_screen.dart';
import 'package:hola/view/utils/themes/dark_mode.dart';
import 'package:hola/view/utils/themes/light_mode.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Hola Chat',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(switchController).isSwitch ? darkMode : lightMode,
      darkTheme: ref.watch(switchController).isSwitch ? lightMode : darkMode,
      routes: {
        '/': (context) => const ScreenHome(),
        'login': (context) => const ScreenLogin(),
        'settings': (context) => const ScreenSettings()
      },
      initialRoute: '/',
    );
  }
}
