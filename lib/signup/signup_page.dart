import 'package:expense_manager/app_page_injectable.dart';
import 'package:expense_manager/common/popup_notification.dart';
import 'package:expense_manager/login/button.dart';
import 'package:expense_manager/login/square_tile.dart';
import 'package:expense_manager/login/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: usernameController.text,
                password: passwordController.text)
            .then((value) {
          context.gNavigationService.openHome(context);
        });
      }else{
         ErrorPopUpNotification.create(
            context: context,
            title: "Wrong Password",
            message: "You must confirm your password");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ErrorPopUpNotification.create(
            context: context,
            title: "Wrong Password",
            message: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        ErrorPopUpNotification.create(
            context: context,
            title: "Wrong Email",
            message: "The account already exists for that email.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 25),
              Text(
                "let's create an account for you !",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              LoginPageTextField(
                controller: usernameController,
                hintText: "Username",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              LoginPageTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 10),
              LoginPageTextField(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              MyButton(
                title: "Sign Up",
                onTap: () {
                  signUserUp();
                },
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    onTap: () {},
                    icon: FontAwesomeIcons.google,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  SquareTile(
                    onTap: () {},
                    icon: FontAwesomeIcons.facebook,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  SquareTile(
                    onTap: () {},
                    icon: FontAwesomeIcons.fingerprint,
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.gNavigationService.openLoginScreen(context);
                    },
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
