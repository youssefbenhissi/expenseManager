import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:expense_manager/app_page_injectable.dart';
import 'package:expense_manager/common/menu.dart';
import 'package:expense_manager/home/plus_button.dart';
import 'package:expense_manager/home/top_card.dart';
import 'package:expense_manager/home/transaction.dart';
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
        Menu(user: user),
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
                  backgroundColor: Colors.grey[300],
                  appBar: AppBar(
                    elevation: 0,
                    iconTheme: const IconThemeData(color: Colors.white),
                    backgroundColor: Colors.black,
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
                        const Text(
                          "Balance",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    automaticallyImplyLeading: false,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        TopNeuCard(
                            balance: "20,000",
                            expense: '\$ 200',
                            income: '\$ 100'),
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Column(
                                children: const [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MyTransaction(
                                    transactionName: 'Teaching',
                                    money: '300',
                                    expenseOrIncome: 'income',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const PlusButton(),
                      ],
                    ),
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
