import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:riders_app/constants.dart';

import '../../../api/NearbyTailorServices.dart';

class ServiceAbout extends StatefulWidget {

  TailorServices tailorService;


  ServiceAbout(this.tailorService);


  @override
  _ServiceAboutState createState() => _ServiceAboutState(tailorService);
}

class _ServiceAboutState extends State<ServiceAbout> {
  late TailorServices tailorService ;

  _ServiceAboutState(tailorService){
    this.tailorService = tailorService;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            height: 190.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(tailorService.imgUrl.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ListTile(
          title: Text(
            tailorService.name!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text(
            "Price (PKR)",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            tailorService.price.toString()!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            "Order Completed",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            "order completed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ), ListTile(
          leading: Icon(Icons.person),
          title: Text(
            "Average Rating",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            "rating",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        Divider(),
        ListTile(
          title: Text(
            "Description\n",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            tailorService.description!,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
