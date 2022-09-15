import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/homescreen.dart';
import 'sign_in_screen.dart';

class LoginCheckScreen extends StatelessWidget {
  const LoginCheckScreen({Key? key}) : super(key: key);
  static String routeName = "/logincheckscreen";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        });
  }
}
