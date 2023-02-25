import 'package:riders_app/api/CompletedDelivery.dart';
import 'package:riders_app/api/OrdersService.dart';
import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/api/location.dart';
import 'package:riders_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riders_app/models/delievery_model.dart';
import 'package:riders_app/screens/find_route/navigation_screen.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

class OnGoingDeliveries extends StatefulWidget {
  @override
  _OnGoingDeliveriesState createState() => _OnGoingDeliveriesState();
}

class _OnGoingDeliveriesState extends State<OnGoingDeliveries> {
  String button_text = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<DelieverModel> deliverData = [
    DelieverModel(
      address: "Caira naser City street 32",
      dateTime: "Jan 16, 2022 4:46 AM",
      name: "Mohamed Ali",
      number: "123465789",
      orderStatue: "In Progress",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text(
            "On Going Delivery",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ...List.generate(
                      1,
                      (index) {
                        final data = ongoingdDeliveries[index];
                        button_text =
                            data.towardsCustomer ? "To Customer" : "To Tailor";
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 130,
                            width: 370,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(2, 0),
                                  blurRadius: 5,
                                  spreadRadius: 0.05,
                                ),
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(-2, 5),
                                  blurRadius: 5,
                                  spreadRadius: 0.05,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.orderStatus,
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [

                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "Click button to view map",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "For Pick Up & Drop Off",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          if (button_text == "To Tailor") {
                                            if (await deliverToTailor(
                                                ongoingdDeliveries[0].id)) {
                                              setState(() {
                                                ongoingdDeliveries.clear();
                                                button_text =  "Completed";
                                              });
                                            }

                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NavigationScreen(
                                                            latitude,
                                                            longitude)));
                                          }

                                          if (button_text == "To Customer") {
                                            if (await deliverToCustomer(
                                                ongoingdDeliveries[0].id)) {
                                              setState(() {
                                                ongoingdDeliveries.clear();
                                              });
                                            }

                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NavigationScreen(
                                                            latitude,
                                                            longitude)));
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              button_text,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
