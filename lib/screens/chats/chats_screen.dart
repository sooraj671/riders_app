import 'package:riders_app/constants.dart';
import 'package:flutter/material.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/appBar_build.dart';
import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar("Inbox"),
        body: const Body(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.chat));
  }


}
