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
Widget myButton({
  required String title,
  required Color color,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
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

myTextField(
    {required BuildContext context,
    required String hint,
    required TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Theme.of(context).secondaryHeaderColor,
        border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your $hint';
        } else if (hint == 'password' && value.length < 8) {
          return 'Minimum 8 letters needed';
        } else {
          return null; 
        }
      },
    ),
  );
}
