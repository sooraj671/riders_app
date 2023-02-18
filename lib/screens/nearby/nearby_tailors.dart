import 'package:riders_app/api/NearByTailors.dart';
import 'package:riders_app/api/api_methods.dart';
import 'package:riders_app/api/service_order_util.dart';
import 'package:riders_app/constants.dart';
import 'package:riders_app/screens/nearby/components/tailor_search_bar.dart';
import 'package:riders_app/screens/services/complete_service_screen.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import '../accounts/profile.dart';
import '../services/components/service_view.dart';
import '../services/service.dart';


class NearByTailors extends StatefulWidget {
  @override
  _NearByTailorsState createState() => _NearByTailorsState();
}

class _NearByTailorsState extends State<NearByTailors> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // var gigs = [
  //   {
  //     "image": "assets/images/gents1.jpeg",
  //     "title": "Create a react application",
  //     "ratings": 5.0,
  //     "reviewCount": 15,
  //     "price": "\$30",
  //     "isFavourite": true
  //   },
  //   {
  //     "image": "assets/images/ladies2.jpeg",
  //     "title": "Create an amazing flutter app",
  //     "ratings": 5.0,
  //     "reviewCount": 11,
  //     "price": "\$5",
  //     "isFavourite": false
  //   },
  //   {
  //     "image": "assets/images/ladies1.jpeg",
  //     "title": "Create a prototype with adobe xd",
  //     "ratings": 5.0,
  //     "reviewCount": 10,
  //     "price": "\$15",
  //     "isFavourite": true
  //   },
  //   {
  //     "image": "assets/images/gents3.jpeg",
  //     "title": "Create a nodejs rest api",
  //     "ratings": 5.0,
  //     "reviewCount": 20,
  //     "price": "\$20",
  //     "isFavourite": false
  //   },
  //   {
  //     "image": "assets/images/gents2.jpeg",
  //     "title": "Create a logo animation",
  //     "ratings": 5.0,
  //     "reviewCount": 15,
  //     "price": "\$5",
  //     "isFavourite": false
  //   },
  //   {
  //     "image": "assets/images/ladies3.webp",
  //     "title": "Create a professional logo",
  //     "ratings": 5.0,
  //     "reviewCount": 15,
  //     "price": "\$5",
  //     "isFavourite": true
  //   },
  // ];


  @override
  Widget build(BuildContext context) {
    showPopUp(nearByTailorList.length.toString());
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text("Near By Tailors",
              style: TextStyle(color: kPrimaryColor),),

          ),
          body: Column(
              children: [
                Expanded(
                    child: ListView.builder(

                      itemCount: nearByTailorList.length,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, top: 5.0, right: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              service_id = nearByTailorList[index].id!;
                              service_price = nearByTailorList[index].price!;
                              showPopUp(service_price);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ServiceView( nearByTailorList[index]
                                      )));
                            },
                            child: Card(
                              child: Container(
                                height: 120,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                nearByTailorList[index].imgUrl!
                                                    ),

                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 120.0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5.0,
                                            horizontal: 10.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .end,
                                            children: <Widget>[
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.star,
                                                            size: 12.0,
                                                            color: Colors.amber,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 4.0),
                                                            child: Text(
                                                              'ratings',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 4.0),
                                                            child: Text(
                                                              "('order count')",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Container(
                                                        width: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width *
                                                            0.35,
                                                        child: Text(
                                                          nearByTailorList[index].name
                                                              .toString(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .end,
                                                children: <Widget>[
                                                  Text(
                                                    "PKR. ",
                                                    style: TextStyle(
                                                      color: kPrimaryColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    nearByTailorList[index].price
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ))
              ]),

          bottomNavigationBar: CustomBottomNavBar(
              selectedMenu: MenuState.locate),
        )
    );
  }
}
