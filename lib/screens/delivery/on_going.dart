import 'package:riders_app/api/CompletedDelivery.dart';
import 'package:riders_app/api/OrdersService.dart';
import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riders_app/models/delievery_model.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

class OnGoingDeliveries extends StatefulWidget {
  @override
  _OnGoingDeliveriesState createState() => _OnGoingDeliveriesState();
}

class _OnGoingDeliveriesState extends State<OnGoingDeliveries> {
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

  String button_text = "Reached";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text("On Going Delivery",
            style: TextStyle(color: kPrimaryColor),),

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
                      ongoingdDeliveries.length,
                          (index) {
                        final data = ongoingdDeliveries[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            height: 130,
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
                                          Text(
                                            data.description,
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
                                            "Pick Up: "+data.pickUpLocation,
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
                                            "Drop Off: "+data.dropUpLocation,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),



                                        ],
                                      ),
                                      SizedBox(width: 50,),
                                      InkWell(
                                        onTap: () async {
                                          // if (await acceptDelivery(data.id.toString())) {



                                              if(button_text == "Complete"){
                                                if( await deliverToTailor(data.id)){
                                                  showPopUp("Delivered to Tailor");
                                                  setState(() {

                                                    // completedDeliveries.add(ongoingdDeliveries[index] as CompletedDelivery);
                                                    ongoingdDeliveries.removeAt(index);

                                                  });

                                                }


                                              }else{
                                                setState(() {
                                                  showPopUp("Delivered to Customer");
                                                  button_text = "Complete";

                                                });

                                              }
                                              // ongoingdDeliveries.add(availableDeliveries[index]);
                                              // availableDeliveries.removeAt(index);


                                          // }
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
