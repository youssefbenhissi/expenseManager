import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:expense_manager/app_page_injectable.dart';
import 'package:expense_manager/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SafeArea(
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
                      backgroundImage: (user.photoURL != null &&
                              user.photoURL!.isEmpty)
                          ? AssetImage(user.photoURL.toString())
                          : const AssetImage("assets/images/unknown-user.png"),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      user.email.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20.0),
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

                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
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
                          print("logout Successfully");
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
        ),
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(microseconds: 500),
            curve: Curves.easeIn,
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: Scaffold(
                  appBar: AppBar(
                    title: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              value == 1 ? value = 0 : value = 1;
                            });
                          },
                        ),
                        const Text("3D Drawer Menu"),
                      ],
                    ),
                    automaticallyImplyLeading: false,
                  ),
                  body: const Center(
                    child: Text("Swipe right"),
                  ),
                ),
              ));
            }),
        GestureDetector(
          onHorizontalDragUpdate: (e) {
            if (e.delta.dx > 0) {
              setState(() {
                value = 1;
              });
            } else {
              setState(() {
                value = 0;
              });
            }
          },
        )
      ]),
    );
  }
}
