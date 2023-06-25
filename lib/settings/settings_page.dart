import 'package:expense_manager/settings/models/setting.dart';
import 'package:expense_manager/settings/widgets/setting_tile.dart';
import 'package:expense_manager/settings/widgets/support_card.dart';
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
                    onPressed: () {},
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
                Column(
                  children: List.generate(
                    settings.length,
                    (index) => SettingTile(setting: settings[index]),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Column(
                  children: List.generate(
                    settings2.length,
                    (index) => SettingTile(setting: settings2[index]),
                  ),
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
