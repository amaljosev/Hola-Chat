import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hola/controller/boarding/riverpod.dart';
import 'package:lottie/lottie.dart';

class ScreenSplash extends ConsumerStatefulWidget {
  const ScreenSplash({super.key});

  @override
  ConsumerState<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends ConsumerState<ScreenSplash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        ref.read(splashOpacityProvider.notifier).state = 1.0;
      },
    );
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacementNamed(context, 'layout');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('lib/assets/animations/bird.json'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: ref.watch(splashOpacityProvider),
              duration: const Duration(milliseconds: 500),
              child: Text(
                'HolaChat',
                style: GoogleFonts.amaranth(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal:58.0,vertical: 42.0), 
          child: LinearProgressIndicator(minHeight: 10,borderRadius: BorderRadius.all(Radius.circular(10)),),
        ),
      ],
    ));
  }
}
