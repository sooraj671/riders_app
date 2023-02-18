import 'package:riders_app/grid.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'home_header.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
