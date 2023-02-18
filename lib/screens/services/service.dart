import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/constants.dart';
import 'package:riders_app/screens/accounts/profile_about.dart';
import 'package:riders_app/screens/accounts/profile_gigs.dart';
import 'package:riders_app/screens/accounts/profile_reviews.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:riders_app/screens/complete_profile/components/complete_profile_form.dart';
import 'package:riders_app/screens/services/complete_service_screen.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';


class ServicePage extends StatelessWidget {

  static String routeName = "/services";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          title: Text("Your Services", style:
        TextStyle(color:kPrimaryColor),
    ),
    ),
    floatingActionButton: FloatingActionButton(
    // isExtended: true,
    child: Icon(Icons.add),
    backgroundColor: Colors.green,
    onPressed: () {
      showPopUp("s");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return CompleteServiceScreen();
      }));
    }),
    body: TailorServices(),
    ),
    );
  }
}
