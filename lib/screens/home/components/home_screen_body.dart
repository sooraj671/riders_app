import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riders_app/api/OrdersService.dart';
import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/constants.dart';
import 'package:riders_app/screens/delivery/completed_delivery.dart';
import 'package:riders_app/screens/delivery/deliver_screen.dart';
import 'package:riders_app/screens/delivery/on_going.dart';
import 'package:riders_app/screens/earnings/earnings.dart';
import 'package:riders_app/screens/find_route/navigation_screen.dart';
import 'package:riders_app/screens/nearby/components/current_location_screen.dart';
import 'package:riders_app/screens/sign_in/sign_in_screen.dart';

import '../../../models/home_model.dart';
import '../../orders/manage_sales.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({super.key});

  final List<HomeModel> homeData = [
    HomeModel(
      icon: const Icon(
        Icons.location_searching,
        color: Colors.white,
        size: 50,
      ),
      title: "Set Location",
    ),
    HomeModel(
      icon: const Icon(
        Icons.delivery_dining,
        color: Colors.white,
        size: 50,
      ),
      title: "Avaiable Delivery",
    ),
    HomeModel(
      icon: const Icon(
        Icons.route,
        color: Colors.white,
        size: 50,
      ),
      title: "In Progress",
    ),
    HomeModel(
      icon: const Icon(
        Icons.check,
        color: Colors.white,
        size: 50,
      ),
      title: "Completed",
    ),
    HomeModel(
      icon: const Icon(
        Icons.monetization_on,
        color: Colors.white,
        size: 50,
      ),
      title: "Total Earnings",
    ),
    HomeModel(
      icon: const Icon(
        Icons.logout,
        color: Colors.white,
        size: 50,
      ),
      title: "Logout",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            itemCount: homeData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final data = homeData[index];
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  log(index.toString());
                  if (index == 0) {

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  CurrentLocationScreen()));
                  } else if (index == 1) {
                    await getAvailableDelivery();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliverScreen()));
                  } else if (index == 2) {
                    await getOngoingDelivery();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnGoingDeliveries()));
                  } else if (index == 3) {
                    await getCompletedDelivery();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompletedDeliveries()));
                  } else if (index == 4) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EarningsPage()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(5),
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
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          data.icon,
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            data.title,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
