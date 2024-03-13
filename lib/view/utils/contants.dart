import 'package:flutter/material.dart';

var myAppbar = AppBar(
  title: const Text('Hola'),
);
drawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        const DrawerHeader(child: Icon(Icons.favorite)),
        const ListTile(
          title: Text('D A S H B O A R D'),
        ),
        ListTile(
          title: const Text('S E T T I N G S'),
          onTap: () => Navigator.pushNamed(context, 'settings'),
        ),
        ListTile(
          title: const Text('L O G O U T'),
          onTap: () => Navigator.pushNamed(context, 'login'),
        ),
      ],
    ),
  );
}

var popupButton = PopupMenuButton<String>(
  itemBuilder: (BuildContext context) {
    return {'Logout', 'Settings'}.map((String choice) {
      return PopupMenuItem<String>(
        value: choice,
        child: Text(choice),
      );
    }).toList();
  },
  onSelected: (value) {
    // switch (value) {
    //   case 'Logout':
    //     Navigator.pushNamed(context, 'login');
    //   case 'Settings':
    //     Navigator.pushNamed(context, 'settings');
    // }
  },
);
myButton(
    {required Function function, required String title, required Color color}) {
  return ElevatedButton(
    onPressed: () => function,
    style: const ButtonStyle(
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)))),
        backgroundColor: MaterialStatePropertyAll(Colors.indigo)),
    child: Text(
      title,
      style: TextStyle(
        color: color,
      ),
    ),
  );
}
