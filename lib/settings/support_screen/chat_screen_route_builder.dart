import 'package:flutter/material.dart';

import 'chat_screen.dart';

class ChatScreenRouteBuilder {
  ChatScreenRouteBuilder();

  Widget call(BuildContext context) {
    return const ChatScreen(
      email: "",
      name: "",
    );
  }
}
