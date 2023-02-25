import 'package:riders_app/api/OrdersService.dart';
import 'package:riders_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riders_app/models/delievery_model.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

class CompletedDeliveries extends StatefulWidget {
  @override
  _CompletedDeliveriesState createState() => _CompletedDeliveriesState();
}

class _CompletedDeliveriesState extends State<CompletedDeliveries> {
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
      orderStatue: "Completed",
    ),
    DelieverModel(
      address: "Caira naser City street 32",
      dateTime: "Jan 16, 2022 4:46 AM",
      name: "Sooraj bhai",
      number: "123465789",
      orderStatue: "Completed",
    ),
    DelieverModel(
      address: "Caira naser City street 32",
      dateTime: "Jan 16, 2022 4:46 AM",
      name: "Virus.dev",
      number: "123465789",
      orderStatue: "Completed",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text(
            "Completed Delivery",
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
                      completedDeliveries.length,
                      (index) {
                        final data = completedDeliveries[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            height: 120,
                            width: 350,
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
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                          Text(
                                            "Order Description",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "On Time",
                                            style: const TextStyle(
                                              color: Colors.black,                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "Location: "+data.order.dropUpLocation,
                                            style: const TextStyle(
                                              color: Colors.black,                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "Total Price: "+ data.order.price,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
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
