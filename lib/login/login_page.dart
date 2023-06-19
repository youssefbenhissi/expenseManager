import 'dart:async';

import 'package:expense_manager/app_page_injectable.dart';
import 'package:expense_manager/common/popup_notification.dart';
import 'package:expense_manager/home/home_page.dart';
import 'package:expense_manager/provider/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey _one = GlobalKey();
  late BuildContext myContext;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final LocalAuthentication auth = LocalAuthentication();
  bool _isPasswordValid = true;
  bool _isEmailValid = true;
  bool _validateEmail(String email) {
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(email);
  }

  void _onEmailChanged(String value) {
    setState(() {
      _isEmailValid = _validateEmail(value);
    });
  }

  void _onPasswordChanged(String value) {
    setState(() {
      _isPasswordValid = value.length >= 5;
    });
  }

  Future<void> _fingerPrintAuthenticate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? '';
    String password = prefs.getString('password') ?? '';
    bool authenticated = false;
    if (email.isEmpty || password.isEmpty) {
      ErrorPopUpNotification.create(
          context: context,
          title: "Device support",
          message:
              "Your device does not support any other login options.Please login by entering your e-mail and password");
    } else {
      try {
        authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          options: const AuthenticationOptions(
            stickyAuth: true,
          ),
        );
        if (authenticated) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      } on PlatformException {
        ErrorPopUpNotification.create(
            context: context,
            title: "Device support",
            message:
                "Your device does not support any other login options.Please login by entering your e-mail and password");
        return;
      }
    }
    if (!mounted) {
      return;
    }
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(myContext).startShowCase([_one]);
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: width,
            height: height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/loginimg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign into your account",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2),
                        )
                      ]),
                  child: TextField(
                    onChanged: _onEmailChanged,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      errorText:
                          _isEmailValid ? null : 'Please enter a valid email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2),
                        )
                      ]),
                  child: TextField(
                    obscureText: true,
                    onChanged: _onPasswordChanged,
                    controller: passwordController,
                    decoration: InputDecoration(
                      errorText: _isPasswordValid
                          ? null
                          : 'Password must be at least 5 characters',
                      hintText: AppLocalizations.of(context)!.motDePasseTitre,
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (_isEmailValid && _isPasswordValid) {
                context.gNavigationService.openHome(context);
              } else {
                ErrorPopUpNotification.create(
                    context: context,
                    title: "Error",
                    message: "veirfy your credentials please !");
              }
            },
            child: Container(
              width: width * 0.5,
              height: height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: AssetImage("assets/images/loginbtn.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      fit: BoxFit.cover),
                ),
                ShowCaseWidget(builder: Builder(builder: (context) {
                  myContext = context;
                  return Showcase(
                    key: _one,
                    title: 'Facebook',
                    description: 'You can login via Facebook',
                    child: GestureDetector(
                      onTap: _fingerPrintAuthenticate,
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.facebook_outlined,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  );
                })),
                GestureDetector(
                  onTap: _fingerPrintAuthenticate,
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.fingerprint,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    final provider =
                        Provider.of<LocaleProvider>(context, listen: false);

                    provider.setLocale(const Locale('fr'));
                  },
                  child: const Text("FRANÇAIS",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ))),
              TextButton(
                  onPressed: () {
                    final provider =
                        Provider.of<LocaleProvider>(context, listen: false);

                    provider.setLocale(const Locale('ar'));
                  },
                  child: const Text("العربية",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ))),
              TextButton(
                  onPressed: () {
                    final provider =
                        Provider.of<LocaleProvider>(context, listen: false);

                    provider.setLocale(const Locale('en'));
                  },
                  child: const Text("English",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
