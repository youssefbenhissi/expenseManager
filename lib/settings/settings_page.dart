import 'package:expense_manager/app_page_injectable.dart';
import 'package:expense_manager/settings/constants.dart';
import 'package:expense_manager/settings/widgets/support_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/avatar.png",
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.yellow,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text("youssef", style: Theme.of(context).textTheme.headline4),
                Text("youssef.benhissi@esprit.tn",
                    style: Theme.of(context).textTheme.bodyText2),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      context.gNavigationService.openAccountProfile(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text(
                      "Edit",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Column(children: [
                  GestureDetector(
                    onTap: () {
                      context.gNavigationService.openAccountProfile(context);
                    }, // Navigation
                    child: SizedBox(
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: klightContentColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                                CupertinoIcons.person_fill,
                                color: kprimaryColor),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Personal Data",
                            style: TextStyle(
                              color: kprimaryColor,
                              fontSize: ksmallFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            CupertinoIcons.chevron_forward,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.gNavigationService.openFaq(context);
                    }, // Navigation
                    child: SizedBox(
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: klightContentColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                                CupertinoIcons.settings,
                                color: kprimaryColor),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Settings",
                            style: TextStyle(
                              color: kprimaryColor,
                              fontSize: ksmallFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            CupertinoIcons.chevron_forward,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.gNavigationService.openFaq(context);
                    }, // Navigation
                    child: SizedBox(
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: klightContentColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                                CupertinoIcons.doc_fill,
                                color: kprimaryColor),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "E-Statements",
                            style: TextStyle(
                              color: kprimaryColor,
                              fontSize: ksmallFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            CupertinoIcons.chevron_forward,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.gNavigationService.openFaq(context);
                    }, // Navigation
                    child: SizedBox(
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: klightContentColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                                CupertinoIcons.heart_fill,
                                color: kprimaryColor),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Refferal Code",
                            style: TextStyle(
                              color: kprimaryColor,
                              fontSize: ksmallFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            CupertinoIcons.chevron_forward,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.gNavigationService.openFaq(context);
                      }, // Navigation
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: klightContentColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                  CupertinoIcons.ellipsis_vertical_circle_fill,
                                  color: kprimaryColor),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "FAQ",
                              style: TextStyle(
                                color: kprimaryColor,
                                fontSize: ksmallFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              CupertinoIcons.chevron_forward,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.gNavigationService.openAccountProfile(context);
                      }, // Navigation
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: klightContentColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                  CupertinoIcons.pencil_circle_fill,
                                  color: kprimaryColor),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Our Handbook",
                              style: TextStyle(
                                color: kprimaryColor,
                                fontSize: ksmallFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              CupertinoIcons.chevron_forward,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.gNavigationService.openAccountProfile(context);
                      }, // Navigation
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: klightContentColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(CupertinoIcons.person_3_fill,
                                  color: kprimaryColor),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Community",
                              style: TextStyle(
                                color: kprimaryColor,
                                fontSize: ksmallFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              CupertinoIcons.chevron_forward,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const SupportCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
