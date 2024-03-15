import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hola/controller/boarding/riverpod.dart';
import 'package:hola/view/utils/contants.dart';

final formKey = GlobalKey<FormState>();

class ScreenLogin extends ConsumerWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HolaChat',
                        style: GoogleFonts.amaranth(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      myTextField(
                          context: context,
                          hint: 'Username',
                          controller: ref.watch(userNameController)),
                      ref.watch(isSignupProvider)
                          ? myTextField(
                              context: context,
                              hint: 'Email',
                              controller: ref.watch(emailController))
                          : const Row(),
                      ref.watch(isSignupProvider)
                          ? myTextField(
                              context: context,
                              hint: 'Phone Number',
                              controller: ref.watch(phoneNumberController))
                          : const Row(),
                      myTextField(
                          context: context,
                          hint: 'Password',
                          controller: ref.watch(passwordController)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: myButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      ref.watch(isSignupProvider)
                                          ? ref.watch(isSignupLoadingProvider)
                                              ? log('loading')
                                              : ref.watch(signUp).then(
                                                  (value) => ref.watch(
                                                          isSignupSuccessProvider)
                                                      ? Navigator
                                                          .pushReplacementNamed(
                                                              context, 'home')
                                                      : log('error'))
                                          : log('login');
                                    }
                                  },
                                  title: ref.watch(isSignupProvider)
                                      ?ref.watch(isSignupLoadingProvider)?'Loading...': 'Sign Up' 
                                      : 'Login',
                                  color: Theme.of(context).highlightColor),
                            )
                          ],
                        ),
                      ),
                      ref.watch(isSignupProvider)
                          ? const Row()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Forgot your login details?",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Get help",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text('OR'),
                            ),
                            Expanded(
                              child: Container(
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Image(
                                  image: AssetImage(
                                      'lib/assets/images/google.png')),
                            ),
                            SizedBox(width: 20),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'lib/assets/images/apple-dark.png'),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ref.watch(isSignupProvider)
                                  ? "Already have an account?" 
                                  : "Don't have an account?",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                final bool val =
                                    ref.watch(isSignupProvider.notifier).state;

                                ref.read(isSignupProvider.notifier).state =
                                    !val;
                              },
                              child: Text(
                                ref.watch(isSignupProvider)
                                    ? 'Login'
                                    : "Sign up",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
