import 'package:riders_app/constants.dart';
import 'package:riders_app/screens/accounts/profile_about.dart';
import 'package:riders_app/screens/accounts/profile_gigs.dart';
import 'package:riders_app/screens/accounts/profile_reviews.dart';
import 'package:flutter/material.dart';

import '../../api/tailor_util.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("$tailor_name", style:
            TextStyle(color:kPrimaryColor),),
        ),
        body: AboutPage(),

      ),
    );
  }
}
