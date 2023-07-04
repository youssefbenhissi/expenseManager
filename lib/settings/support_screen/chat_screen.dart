import 'package:expense_manager/app_page_injectable.dart';
import 'package:expense_manager/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

class ChatScreen extends StatefulWidget {
  final String email;
  final String name;
  const ChatScreen({super.key, required this.email, required this.name});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          onPressedFunction: () {
            context.gNavigationService.openSettings(context);
          },
          title: 'Support Page'),
      body: Tawk(
        directChatLink:
            "https://tawk.to/chat/603acfdc385de407571acca1/1evirnttb",
        visitor: TawkVisitor(
          name: widget.name,
          email: widget.email,
        ),
        placeholder: Center(
          child: SizedBox(
            height: 120,
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/chat_support.jpg",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
