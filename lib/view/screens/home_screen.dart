import 'dart:developer';

import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});



  @override
  Widget build(BuildContext context) {
      WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hola'),
          actions: [
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Settings'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              onSelected: (value) {
                switch (value) {
                  case 'Logout':
                    Navigator.pushNamed(context, 'settings');
                  case 'Settings':
                    Navigator.pushNamed(context, 'settings');
                }
              },
            ),
          ],
        ),
        body: const Center(child: Text('body')));
  }
}
initial()=>log('aldkjdjd'); 