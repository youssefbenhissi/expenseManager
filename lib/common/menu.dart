import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:expense_manager/app_page_injectable.dart';
import 'package:expense_manager/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[400]!,
              Colors.blue[800]!,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        width: 200.0,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage:
                      (user.photoURL != null && user.photoURL!.isEmpty)
                          ? AssetImage(user.photoURL.toString())
                          : const AssetImage("assets/images/unknown-user.png"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  user.email.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ],
            )),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Home",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      final snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Device support',
                          message:
                              'Your device does not support any other login options.Please login by entering your e-mail and password',
                          contentType: ContentType.failure,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    },
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Person",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      context.gNavigationService.openSettings(context);
                    },
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut().then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowCaseWidget(
                              builder: Builder(
                                  builder: (context) => const LoginPage()),
                            ),
                          ),
                        );
                      });
                    },
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
