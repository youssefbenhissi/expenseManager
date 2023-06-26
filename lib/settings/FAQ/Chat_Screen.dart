import 'package:lottie/lottie.dart';
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
      appBar: AppBar(
        title: const Text('Support'),
        backgroundColor: const Color(0XFFF7931E),
        elevation: 0,
      ),
      body: Tawk(
        directChatLink:
            "https://tawk.to/chat/603acfdc385de407571acca1/1evirnttb",
        visitor: TawkVisitor(
          name: widget.name,
          email: widget.email,
        ),
        placeholder: Center(
          child: Lottie.asset(
            'assets/lottie/chatsupport.json',
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
