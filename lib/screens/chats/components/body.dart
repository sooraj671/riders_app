import 'package:riders_app/components/filled_outline_button.dart';
import 'package:riders_app/constants.dart';
import 'package:riders_app/models/Chat.dart';
import 'package:riders_app/screens/chats/components/search_chat_field.dart';
import 'package:riders_app/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';

import '../../home/components/search_field.dart';
import 'chat_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SearchChatField(),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: ((context, index) => ChatCard(
                  chat: chatsData[index],
                  press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MessagesScreen())),
                )),
          ),
        )
      ],
    );
  }
}
