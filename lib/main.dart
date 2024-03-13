import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hola/controller/settings/riverpod.dart';
import 'package:hola/responsive/responsive_layouts.dart';
import 'package:hola/view/screens/mobile/boarding/splash_screen.dart';
import 'package:hola/view/screens/mobile/home_screen.dart';
import 'package:hola/view/screens/mobile/boarding/login.dart';
import 'package:hola/view/screens/mobile/mobile_layout.dart';
import 'package:hola/view/screens/mobile/settings/settings_screen.dart';
import 'package:hola/view/screens/tab/tab_screen.dart';
import 'package:hola/view/screens/web/web_layout.dart';
import 'package:hola/view/utils/themes/dark_mode.dart';
import 'package:hola/view/utils/themes/light_mode.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider.notifier);

    return MaterialApp(
      title: 'Hola Chat',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeMode.state,
      routes: {
        'splash': (context) => const ScreenSplash(),
        'layout': (context) => const ResponsiveLayout(
            mobileLayout: MobileLayout(),
            tabLayout: TabLayout(),
            webLayout: WebLayout()),
        'home': (context) => const ScreenHome(),
        'login': (context) => const ScreenLogin(),
        'settings': (context) => const ScreenSettings()
      },
      initialRoute: 'login',
    );
  }
}
