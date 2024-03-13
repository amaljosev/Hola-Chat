import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hola/view/utils/contants.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text('HolaChat',
                        style: GoogleFonts.amaranth(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'username',
                          filled: true,
                          fillColor: Theme.of(context).secondaryHeaderColor,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'password',
                            filled: true,
                            fillColor: Theme.of(context).secondaryHeaderColor,
                            border: InputBorder.none),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: myButton(
                                function: () {},
                                title: 'Login',
                                color: Theme.of(context).highlightColor),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot your login details?",
                          style: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor),
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
                                image:
                                    AssetImage('lib/assets/images/google.png')),
                          ),
                          SizedBox(width: 20),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/assets/images/apple-dark.png'),
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
                            "Don't have an account?",
                            style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Sign up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
