import 'dart:developer';

import 'package:riders_app/api/service_order_util.dart';
import 'package:riders_app/api/tailor_util.dart';
import 'package:riders_app/constants.dart';
import 'package:riders_app/screens/accounts/profile_about.dart';

import 'package:riders_app/screens/accounts/profile_reviews.dart';
import 'package:riders_app/screens/chats/chats_screen.dart';
import 'package:riders_app/screens/nearby/nearby_tailors.dart';
import 'package:riders_app/screens/order_success/order_success_screen.dart';
import 'package:riders_app/screens/payment_success/payment_success_screen.dart';
import 'package:riders_app/screens/service_order_succes/serivce_success_screen.dart';
import 'package:riders_app/screens/service_order_succes/service_payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/screens/services/components/ServiceAbout.dart';

import '../../../api/NearbyTailorServices.dart';
import '../../../api/api_methods.dart';
import '../../../components/coustom_bottom_nav_bar.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../enums.dart';

class ServiceView extends StatefulWidget {
  TailorServices tailorService;

  ServiceView(this.tailorService);

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  final List<String?> errors = [];

  String service_order_description = "";

  // Initial Selected Value
  String dropdownvalue = 'Sample Suit';
  String select = "";

  // List of items in our dropdown menu
  var items = ['Sample Suit', 'Small Size', 'Medium Size', 'Large Size'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();

  //

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tailor Service",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
        body: ServiceAbout(widget.tailorService),
        floatingActionButton: FloatingActionButton(
            isExtended: true,
            child: Text("Buy"),
            backgroundColor: Colors.green,
            onPressed: () {
              showInformationDialog(context);
            }),
      ),
    );
  }

  Future<void> showInformationDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Order Description:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        maxLines: 5,
                        controller: _textEditingController,
                        validator: (value) {
                          return value!.isNotEmpty
                              ? null
                              : "Please fill details";
                        },
                        decoration: InputDecoration(
                            hintText: "Please describe your order"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Please Choose Measurment Type:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            // Initial Value
                            value: dropdownvalue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                showPopUp(dropdownvalue);
                                ser_measure_type = dropdownvalue;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
              title: Text('Complete your order'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        color: kPrimaryColor,
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Navigator.of(context).pop();

                          ser_order_desc = _textEditingController.text;
                          showPopUp(ser_order_desc);
                          // if (await purchaseService()) {
                            // _textEditingController.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServicePaymentSuccessScreen()),
                            );
                          } else {
                            // showLoaderDialog(context);
                          }
                        // }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        color: kPrimaryColor,
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          });
        });
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7),
              child: Text("Please wait for confirmation")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
