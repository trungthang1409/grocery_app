import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../sevices/untils.dart';
import 'btm_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final untils = Untils(context);
    Size size = untils.getsizeScreen;
    Color color = untils.color;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            const Text(
              'Hi!',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Text(
              'Welcome to comeback',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIconColor: Colors.blueGrey,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIconColor: Colors.blueGrey,
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, BottomBarScreen.routeName);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 109, 187, 251),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38),
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
                fixedSize: MaterialStateProperty.all(
                  Size(size.width * 0.9, size.height * 0.065),
                ),
              ),
              child: TextWidget(
                color: Colors.white,
                text: 'Login',
                textSize: 18,
              ),
            ),
            SizedBox(
              height: size.height * 0.5,
            ),
          ]),
        ),
      ),
    );
  }
}
