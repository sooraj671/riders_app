import 'dart:developer';

import 'package:riders_app/api/customer_profile.dart';
import 'package:riders_app/screens/accounts/profile_about.dart';
import 'package:riders_app/screens/profile/customer_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          InkWell(
            child: CircleAvatar(
              backgroundImage: NetworkImage(imgUrl),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CustomerProfile()),
              );
            },
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
            ),
          )
        ],
      ),
    );
  }
}
