import 'package:expense_manager/app_page_injectable.dart';
import 'package:expense_manager/common/popup_notification.dart';
import 'package:expense_manager/common/shared_preferences_helper.dart';
import 'package:expense_manager/home/home_page.dart';
import 'package:expense_manager/login/button.dart';
import 'package:expense_manager/login/square_tile.dart';
import 'package:expense_manager/login/text_field.dart';
import 'package:expense_manager/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewLoginPage extends StatefulWidget {
  const NewLoginPage({super.key});

  @override
  State<NewLoginPage> createState() => _NewLoginPageState();
}

class _NewLoginPageState extends State<NewLoginPage> {
  late bool _useFingerPrintAuthenticationNextTime;
  final LocalAuthentication auth = LocalAuthentication();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  void initState() {
    _useFingerPrintAuthenticationNextTime = false;
    SharedPreferencesHelper.useFingerPrintAuthentication().then((result) {
      if (result) {
        setState(() {
          _useFingerPrintAuthenticationNextTime = result;
        });
      }
    });
    super.initState();
  }

  Future<bool> signUserIn(
      {required String email, required String password}) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (_useFingerPrintAuthenticationNextTime) {
        SharedPreferencesHelper.setValue(
            SharedPreferencesHelper.PREFERENCES_EMAIL_STRING, email);
        SharedPreferencesHelper.setValue(
            SharedPreferencesHelper.PREFERENCES_PASSWORD_STRING, password);
      } else {
        SharedPreferencesHelper.setValue(
            SharedPreferencesHelper.PREFERENCES_EMAIL_STRING, "");
        SharedPreferencesHelper.setValue(
            SharedPreferencesHelper.PREFERENCES_PASSWORD_STRING, "");
      }
      Navigator.pop(context);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ErrorPopUpNotification.create(
            context: context,
            title: "Wrong Credentials",
            message: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        ErrorPopUpNotification.create(
            context: context,
            title: "Wrong Credentials",
            message: "Wrong password provided for that user.");
      }
      return false;
    }
  }

  Future<void> _fingerPrintAuthenticate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email =
        prefs.getString(SharedPreferencesHelper.PREFERENCES_EMAIL_STRING) ?? '';
    String password =
        prefs.getString(SharedPreferencesHelper.PREFERENCES_PASSWORD_STRING) ??
            '';
    if (email.isEmpty || password.isEmpty) {
      ErrorPopUpNotification.create(
          context: context,
          title: "Wrong Configuration",
          message:
              "You should at least connect using your email and password once and enable the fingerPrint Authentication");
      return;
    }
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      bool successfulLogin = await signUserIn(email: email, password: password);
      if (authenticated && successfulLogin) {
        context.gNavigationService.openHome(context);
      }
    } on PlatformException {
      ErrorPopUpNotification.create(
          context: context,
          title: "Device support",
          message:
              "Your device does not support any other login options.Please login by entering your e-mail and password");
      return;
    }

    if (!mounted) {
      return;
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
              const SizedBox(height: 50),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),
              Text(
                "Welcome back you've been missed !",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SwitchListTile(
                  activeColor: Colors.purple,
                  contentPadding: const EdgeInsets.all(0),
                  value: _useFingerPrintAuthenticationNextTime,
                  title:
                      const Text("Enable FingerPrint Authentication next Time"),
                  onChanged: (val) {
                    setState(() {
                      _useFingerPrintAuthenticationNextTime =
                          !_useFingerPrintAuthenticationNextTime;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MyButton(
                title: "Sign In",
                onTap: () {
                  signUserIn(
                    email: usernameController.text,
                    password: passwordController.text,
                  );
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
                    onTap: () => AuthService().signinWithGoogle(),
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
                    onTap: () async {
                      await _fingerPrintAuthenticate();
                    },
                    icon: FontAwesomeIcons.fingerprint,
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member ?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.gNavigationService.openSignUpScreen(context);
                    },
                    child: const Text(
                      'Register Now',
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
