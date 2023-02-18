import 'package:riders_app/api/OrdersService.dart';
import 'package:riders_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

class ManageSales extends StatefulWidget {
  @override
  _ManageSalesState createState() => _ManageSalesState();
}

class _ManageSalesState extends State<ManageSales> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // var pendingOrders = [
  //   {
  //     "username": "Ramsha",
  //     "online": true,
  //     "image":"",
  //     "gigTitle": "Stitch Designer Suit",
  //     "date": "22 Jan 2022",
  //     "price": "Rs 1005"
  //   },
  //   {
  //     "username": "Amjad",
  //     "online": false,
  //     "image": "",
  //     "gigTitle": "Stitch Designer Suit",
  //     "date": "18 Jan 2022",
  //     "price": "Rs 1035"
  //   },
  //   {
  //     "username": "Sooraj",
  //     "online": true,
  //     "image":
  //        "",
  //     "gigTitle": "Stitch Designer Suit",
  //     "date": "12 Jan 2022",
  //     "price": "Rs 1150"
  //   },
  //   {
  //     "username": "Sajjad",
  //     "online": false,
  //     "image":
  //        "",
  //     "gigTitle": "Stitch Designer Suit",
  //     "date": "15 Jan 2022",
  //     "price": "Rs 1015"
  //   },
  //   {
  //     "username": "Ali",
  //     "online": false,
  //     "image":
  //        "",
  //     "gigTitle": "Stitch Designer Suit",
  //     "date": "15 Jan 2022",
  //     "price": "Rs 1005"
  //   },
  // ];
  //
  // var completedOrders = [
  //   {
  //     "username": "Daniyal",
  //     "online": true,
  //     "image":
  //        "",
  //     "gigTitle": "Stitch Designer Suit",
  //     "date": "02 Dec 2022",
  //     "price": "Rs 10025"
  //   },
  //   {
  //     "username": "Dhanesh",
  //     "image":
  //        "",
  //     "gigTitle": "Stitch Designer Suit",
  //     "date": "15 Dec 2022",
  //     "price": "Rs 1005"
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Your Orders",
          style: TextStyle(color: kPrimaryColor),),


          bottom: TabBar(
            labelColor: Colors.grey,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                child: Text("On Going (${completedOrders.length})", style: TextStyle(color: kPrimaryColor),),
              ),
              Tab(
                child: Text("Completed (${completedOrders.length})", style: TextStyle(color: kPrimaryColor),),

              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              itemCount: pendingOrders.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Pick Up: "+ pendingOrders[index].pickUpLocation.toString(),
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              Text(
                                "Days: ",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Container(
                                  height: 40.0,
                                  child: Text(
                                    "Drop Off: "+ pendingOrders[index].dropUpLocation.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  Text(
                                    "Measurment: "+pendingOrders[index].measurementType.toString(),
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),Text(
                                    "PKR."+pendingOrders[index].price.toString(),
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            // =========  Cancelled Orders   ===========
            ListView.builder(
              itemCount: completedOrders.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Pick Up: "+completedOrders[index].pickUpLocation.toString(),
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Container(
                                  height: 40.0,
                                  child: Text(
                                    "Drop Off: "+completedOrders[index].dropUpLocation.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Measurment: "+completedOrders[index].measurementType.toString(),
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "PKR."+completedOrders[index].price.toString(),
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders),
      ),
    );
  }
}
