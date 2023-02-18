import 'package:flutter/material.dart';
import 'package:riders_app/api/OrdersService.dart';
import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/constants.dart';
import 'package:riders_app/screens/chats/components/appBar_build.dart';

import '../../models/delievery_model.dart';

class DeliverScreen extends StatefulWidget {
  DeliverScreen({super.key});

  @override
  State<DeliverScreen> createState() => _DeliverScreenState();
}

class _DeliverScreenState extends State<DeliverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar("Available Deliveries"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ...List.generate(
                    availableDeliveries.length,
                    (index) {
                      final data = availableDeliveries[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          height: 180,
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.orderStatus,
                                          style: const TextStyle(
                                            color: Colors.green,
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
                                        Text(
                                          "Pick Up: "+data.pickUpLocation,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "Drop Off: "+data.dropUpLocation,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "Earning: 200 Pkr",
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        availableDeliveries.removeAt(index);
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Reject",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (await acceptDelivery(data.id.toString())) {

                                          setState(() {
                                            ongoingdDeliveries.add(availableDeliveries[index]);
                                            availableDeliveries.removeAt(index);
                                            showPopUp("Delivery Accepted");
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Accept",
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
    );
  }
}
