import 'package:flutter/material.dart';
import 'package:hola/view/utils/contants.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: myAppbar,
        ),
        drawer: drawer(context),
        body: const Center(child: Text('body')));
  }
}
