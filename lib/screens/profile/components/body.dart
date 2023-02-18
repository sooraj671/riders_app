import 'package:riders_app/screens/accounts/profile.dart';
import 'package:riders_app/screens/earnings/earnings.dart';
import 'package:riders_app/screens/notifications/notifications.dart';
import 'package:riders_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../../payment/jazzcash/jazzcash.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Notifications(

                  )),
            ),
          ),

          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignInScreen(

                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}
