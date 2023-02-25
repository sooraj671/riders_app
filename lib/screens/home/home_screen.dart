import 'package:flutter/material.dart';
import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/api/customer_profile.dart';
import 'package:riders_app/components/coustom_bottom_nav_bar.dart';
import 'package:riders_app/constants.dart';
import 'package:riders_app/enums.dart';
import 'package:riders_app/screens/home/components/home_screen_body.dart';
import 'package:riders_app/screens/profile/customer_profile.dart';



class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false, // Don't show the leading button
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(child: CircleAvatar(
              radius: 27,
              backgroundImage: NetworkImage(imgUrl),), onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CustomerProfile()),
              );
            },),
            SizedBox(width: 20,),
            Text("Welcome $userName", style: TextStyle(color: Colors.white, fontSize: 28,   ),),
            // Your widgets here
          ],
        ),
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
        // title: Text("Welcome $userName", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic ),), ),
      body: HomeScreenBody(),
    );
  }
}
