import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  BuildContext? context;

  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  Future? init(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        Navigator.pushNamedAndRemoveUntil(context, 'menu', (route) => false);
      }
    });
    this.context = context;
  }

  void goToNewAccont() {
    Navigator.pushNamed(context!, 'register');
  }
}
