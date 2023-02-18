import 'package:riders_app/screens/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
              svgSrc: "assets/icons/Cart Icon.svg",
              press: () {
                Navigator.pushNamed(context, CartScreen.routeName);


              }


              ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            press: () => Navigator.pushNamed(context, Notifications.routeName),
          ),
        ],
      ),
    );
  }
}
