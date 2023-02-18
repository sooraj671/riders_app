import 'package:riders_app/constants.dart';
import 'package:riders_app/screens/messages/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.jpeg'),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Kristin Watson', style: TextStyle(fontSize: 16)),
              Text('Active 3m ago', style: TextStyle(fontSize: 12))
            ],
          )
        ],
      ),
    );
  }
}


