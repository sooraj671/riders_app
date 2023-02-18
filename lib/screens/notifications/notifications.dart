import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riders_app/constants.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

class Notifications extends StatefulWidget {
  static String routeName = "/notifications";
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Future<void> _refreshNotifications() async {}

  Map<String, IconData> _iconMapping = {
    "complete": FontAwesomeIcons.clipboardCheck,
    "Received Money": Icons.monetization_on,
    "congrats": FontAwesomeIcons.award,
    "delivery": FontAwesomeIcons.envelopeOpenText
  };
  var _notifications = [
    {
      "icon": "delivery",
      "notification": "Your delivery is completed. 3d ago",
      "hasRead": false
    },
    {
      "icon": "delivery",
      "notification": "Your delivery is under process. 3d ago",
      "hasRead": false
    },
    {
      "icon": "complete",
      "notification":
          "Sooraj's order is completed. 6d ago",
      "hasRead": true
    },
    {
      "icon": "Received Money",
      "notification": "You have earned Rs 1000. 1w ago",
      "hasRead": false
    },
    {
      "icon": "Received Money",
      "notification": "You have earned Rs 2000. 1w ago",
      "hasRead": true
    },
    {
      "icon": "congrats",
      "notification": "Congrats! You have completed the order",
      "hasRead": true
    },
    {
      "icon": "congrats",
      "notification": "Congrats! You have completed the order",
      "hasRead": true
    },
    {
      "icon": "delivery",
      "notification": "Your delivery is completed. 3d ago",
      "hasRead": false
    },
    {
      "icon": "delivery",
      "notification": "Your delivery is under process. 3d ago",
      "hasRead": false
    },
    {
      "icon": "complete",
      "notification":
      "Sooraj's order is completed. 6d ago",
      "hasRead": true
    },
    {
      "icon": "Received Money",
      "notification": "You have earned Rs 1000. 1w ago",
      "hasRead": false
    },
    {
      "icon": "Received Money",
      "notification": "You have earned Rs 2000. 1w ago",
      "hasRead": true
    },
    {
      "icon": "congrats",
      "notification": "Congrats! You have completed the order",
      "hasRead": true
    },
    {
      "icon": "congrats",
      "notification": "Congrats! You have completed the order",
      "hasRead": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications",
      style: TextStyle(
    color: kPrimaryColor))),
      body: RefreshIndicator(
        onRefresh: _refreshNotifications,
        color: Colors.black87,
        child: ListView.builder(
            itemCount: _notifications.length,
            itemBuilder: (context, int index) {
              return InkWell(
                onTap: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  color: _notifications[index]['hasRead'] != null
                      ? Colors.white
                      : Colors.white12,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: ListTile(
                      leading: Icon(_iconMapping[_notifications[index]['icon']],
                          size: 25.0,
                          color: Colors.grey),
                      title: Text(
                        _notifications[index]['notification'].toString(),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                          fontWeight: _notifications[index]['hasRead'] != null
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      )
        // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile));
    );
  }
}
