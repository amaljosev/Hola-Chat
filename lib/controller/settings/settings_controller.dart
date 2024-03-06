import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchNotifier extends ChangeNotifier {
  bool isSwitch;
  SwitchNotifier({required this.isSwitch});

  Future<void> switchTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isSwitch = !isSwitch;
    prefs.setBool('default_theme', isSwitch);
    notifyListeners();
  }

  Future<bool> checkTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDefault = prefs.getBool('default_theme') ?? false;
    return isDefault;
  }
}
