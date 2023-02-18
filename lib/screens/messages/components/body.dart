import 'package:riders_app/constants.dart';
import 'package:riders_app/models/ChatMessage.dart';
import 'package:riders_app/screens/messages/components/message.dart';
import 'package:riders_app/screens/messages/components/text_message.dart';
import 'package:flutter/material.dart';

import 'chat_input_fields.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: ListView.builder(
            itemCount: demeChatMessages.length,
            itemBuilder: (context, index) => Message(message: demeChatMessages[index]),
          ),
        )),
        ChatInputField()
      ],
    );
  }
}
