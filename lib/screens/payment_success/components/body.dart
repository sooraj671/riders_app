import 'package:riders_app/api/payment.dart';
import 'package:riders_app/screens/order_success/order_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/components/default_button.dart';
import 'package:riders_app/screens/home/home_screen.dart';
import 'package:riders_app/size_config.dart';

import '../../../api/ProductList.dart';
import '../../../api/api_methods.dart';
import '../../../api/payment_gateway.dart';
import '../../../api/shopping_cart.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';
import '../../../helper/keyboard.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  final List<String?> errors = [];

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => accountNumber = newValue.toString() ,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Account Number",
        hintText: "Enter your jazzcash account number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  String accountNumber = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Image.asset(
            "assets/images/jazzcash.png",
            height: SizeConfig.screenHeight * 0.4, //40%
          ),
          Text(
            "Pay with Jazzcash",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          buildPhoneNumberFormField(),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          SizedBox(
            width: SizeConfig.screenWidth * 0.4,
            child: DefaultButton(
              text: "Pay",
              press: () async {
                KeyboardUtil.hideKeyboard(context);
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  acc_num = accountNumber.toString();
                  amount = total_amount.toString();
                  if (await payment()) {
                    Navigator.pushNamed(context, OrderSuccessScreen.routeName);
                  }
                }
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
