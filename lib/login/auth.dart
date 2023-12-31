import 'package:expense_manager/home/home_page.dart';
import 'package:expense_manager/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return ShowCaseWidget(
              builder: Builder(builder: (context) => const LoginPage()),
            );
          }
        },
      ),
    );
  }
}
