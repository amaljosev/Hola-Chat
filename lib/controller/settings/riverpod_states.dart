import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hola/controller/settings/settings_controller.dart';

final switchController = ChangeNotifierProvider<SwitchNotifier>((ref) {
  return SwitchNotifier(isSwitch: false);
});


