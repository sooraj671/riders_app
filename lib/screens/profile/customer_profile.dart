import 'package:riders_app/screens/accounts/profile_about.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/components/coustom_bottom_nav_bar.dart';
import 'package:riders_app/enums.dart';



class CustomerProfile extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.black),),
      ),
      body: AboutPage(),
    );
  }
}
