import 'package:chat_application/screens/home_screen.dart';
import 'package:chat_application/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapShot) {
        //user logged in
        if (snapShot.hasData) {
          return const HomeScreen();
        }
        //user not logged in
        else {
          return const LoginOrRegister();
        }
      },
    ));
  }
}
