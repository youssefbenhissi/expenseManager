import 'package:expense_manager/app_page_injectable.dart';
import 'package:expense_manager/settings/constants.dart';
import 'package:expense_manager/settings/models/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final Setting setting;
  const SettingTile({
    super.key,
    required this.setting,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              child: Icon(setting.icon, color: kprimaryColor),
            ),
            const SizedBox(width: 10),
            Text(
              setting.title,
              style: const TextStyle(
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
    );
  }
}
