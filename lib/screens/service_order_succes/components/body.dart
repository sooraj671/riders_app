import 'package:riders_app/api/shopping_cart.dart';
import 'package:riders_app/screens/nearby/nearby_tailors.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/components/default_button.dart';
import 'package:riders_app/screens/home/home_screen.dart';
import 'package:riders_app/size_config.dart';

import '../../../api/ProductList.dart';
import '../../../api/api_methods.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Order Placed Successfully",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Continue",
            press: ()  {
                if(products_cart.isNotEmpty){
                  products_cart.clear();
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  NearByTailors()),
                );
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
