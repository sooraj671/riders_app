import 'package:flutter/material.dart';

import '../../constants.dart';


class TailorServices extends StatefulWidget {
  @override
  _TailorServicesState createState() => _TailorServicesState();
}

class _TailorServicesState extends State<TailorServices> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var gigs = [
    {
      "image": "https://semantic-ui.com/images/wireframe/image.png",
      "title": "Stitch 2 Suits, with custom design",
      "ratings": 5.0,
      "reviewCount": 15,
      "price": "Rs2030",
      "isFavourite": true
    },
    {
      "image": "https://semantic-ui.com/images/wireframe/image.png",
      "title": "Stitching for an event",
      "ratings": 5.0,
      "reviewCount": 11,
      "price": "Rs205",
      "isFavourite": false
    },
    {
      "image": "https://semantic-ui.com/images/wireframe/image.png",
      "title": "Stitching for kids dress",
      "ratings": 5.0,
      "reviewCount": 10,
      "price": "Rs2015",
      "isFavourite": true
    }
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          
          body: Column(
              children: [
                Expanded(
                    child: ListView.builder(

                      itemCount: gigs.length,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
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
                                          image: AssetImage("assets/images/gents3.jpeg"),

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
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      width: MediaQuery.of(context).size.width *
                                                          0.35,
                                                      child: Text(
                                                        gigs[index]['title'].toString(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  "From ",
                                                  style: TextStyle(
                                                    color: kPrimaryColor,
                                                  ),
                                                ),
                                                Text(
                                                  gigs[index]['price'].toString(),
                                                  style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontWeight: FontWeight.bold,
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
                        );
                      },
                    ))]),
        )
    );
  }
}
