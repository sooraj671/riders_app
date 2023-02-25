import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riders_app/api/deliveries.dart';
import 'package:riders_app/screens/home/home_screen.dart';
import 'package:riders_app/screens/order_success/order_success_screen.dart';

import '../../../api/ProductList.dart';
import '../../../api/api_methods.dart';
import '../../../api/payment.dart';
import '../../../api/payment_gateway.dart';
import '../../../api/shopping_cart.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';
import '../../../helper/keyboard.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  final List<String?> errors = [];

  bool isLoading = false;

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => accountNumber = newValue.toString(),
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
            "Withdraw with Jazzcash",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          buildPhoneNumberFormField(),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          InkWell(
            onTap: () {
              setState(() {
                isLoading = true;
              });
              KeyboardUtil.hideKeyboard(context);
              pay();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kPrimaryColor,
              ),
              height: 50,
              width: 200,
              child: Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        "Withdraw",
                        style: headingStyle.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  pay() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      acc_num = accountNumber.toString();
      amount = total_amount.toString();

      if (await payment() && await withDrawRequest()) {
        setState(() {
          isLoading = false;
        });

        Navigator.pushNamed(context, HomeScreen.routeName);
        showPopUp("Withdraw Completed");
      }
    }
  }
}
