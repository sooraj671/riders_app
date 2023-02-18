import 'package:riders_app/api/customer_profile.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(imgUrl),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$userName",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            "Information",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text(
            "From",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            location.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            "Joined Since",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            join,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.male),
          title: Text(
            "Gender",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            gender.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text(
            "Phone Number",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            contact,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
