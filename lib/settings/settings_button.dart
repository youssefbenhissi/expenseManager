import 'package:expense_manager/settings/constants.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData leadingIcon;
  final IconData trailingIcon;

  const CustomListTile({
    required this.title,
    required this.onTap,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: klightContentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(leadingIcon, color: kprimaryColor),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: kprimaryColor,
          fontSize: ksmallFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(
        trailingIcon,
        color: Colors.grey.shade600,
      ),
    );
  }
}
