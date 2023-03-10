
import 'package:flutter/material.dart';
import 'package:riders_app/screens/home/home_screen.dart';


import '../../../api/ProductList.dart';
import '../../../api/api_methods.dart';
import '../../../components/default_button.dart';
import '../../../size_config.dart';

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
          "Payment Successful",
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
            text: "Deliver More",
            press: ()  {

                Navigator.pushNamed(context, HomeScreen.routeName);

            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
