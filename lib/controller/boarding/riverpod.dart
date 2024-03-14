import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashOpacityProvider = StateProvider<double>((ref) => 0.2);

final userNameController =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final passwordController =
    StateProvider<TextEditingController>((ref) => TextEditingController());
