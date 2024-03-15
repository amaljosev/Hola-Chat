import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hola/model/user_model.dart';

final splashOpacityProvider = StateProvider<double>((ref) => 0.2);

final isSignupProvider = StateProvider<bool>((ref) => false);
final userNameController =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final passwordController =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final emailController =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final phoneNumberController =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final isSignupLoadingProvider = StateProvider<bool>((ref) => false);
final isSignupSuccessProvider = StateProvider<bool>((ref) => false);
final signupErrorProvider = StateProvider<String?>((ref) => null);
final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final signUp = StateProvider((ref) async {
  final auth = ref.read(authProvider);
  final username = ref.watch(userNameController);
  final email = ref.watch(emailController);
  final phoneNumber = ref.watch(phoneNumberController);
  final password = ref.watch(passwordController);

  ref.read(signupErrorProvider.notifier).state = null;
  try {
    await auth
        .createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    )
        .then((value) async {
      final user = UserModel(
          uid: auth.currentUser!.uid,
          userName: username.text,
          email: auth.currentUser?.email as String,
          phoneNumber: phoneNumber.text,
          password: password.text);
      await addUser(user, auth);
      ref.read(isSignupSuccessProvider.notifier).state = true;
     
    });
  } on FirebaseAuthException catch (e) {
    if (kDebugMode) {
      log(e.code);
      log(e.message.toString());
    }
    ref.read(signupErrorProvider.notifier).state = e.message;
  } catch (e) {
    if (kDebugMode) {
      log(e.toString());
    }
    ref.read(signupErrorProvider.notifier).state =
        "An unexpected error occurred.";
  } finally {
    ref.read(isSignupLoadingProvider.notifier).state = false;
  }
});

addUser(UserModel user, FirebaseAuth auth) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(auth.currentUser!.uid)
      .collection('details')
      .add(user.toMap());
}
