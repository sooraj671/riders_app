import 'package:riders_app/api/location.dart';
import 'package:riders_app/screens/home/components/home_screen_body.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../api/api_methods.dart';
import '../../../components/coustom_bottom_nav_bar.dart';
import '../../../enums.dart';
import '../../chats/components/appBar_build.dart';
import '../../home/home_screen.dart';

class CurrentLocationScreen extends StatefulWidget {
  static String routeName = "/locate";

  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Pick Location"),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(fit: StackFit.expand, children: [
        Positioned(
          bottom: 20,
          right: 30,
          child: FloatingActionButton(
            heroTag: 'up',
            onPressed: () async {
              Position position = await _determinePosition();

              googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 14)));

              markers.clear();

             await markers.add(Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: LatLng(position.latitude, position.longitude)));

              setState(() {
                longitude = position.longitude;
                latitude = position.latitude;
                locationPicked = true;
                showPopUp("Location is Picked");
              });


            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.location_on_outlined)),

        ),
        // Add more floating buttons if you want
        // There is no limit
      ]),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () async {
      //     Position position = await _determinePosition();
      //
      //     googleMapController.animateCamera(CameraUpdate.newCameraPosition(
      //         CameraPosition(
      //             target: LatLng(position.latitude, position.longitude),
      //             zoom: 14)));
      //
      //     markers.clear();
      //
      //     markers.add(Marker(
      //         markerId: const MarkerId('currentLocation'),
      //         position: LatLng(position.latitude, position.longitude)));
      //
      //     setState(() {});
      //     // Navigator.push(
      //     //     context,
      //     //     MaterialPageRoute(
      //     //     builder: (context) => NearByTailors(
      //     //
      //     // )));
      //   },
      //   label: const Text("Current Location"),
      //   icon: const Icon(Icons.location_history),
      // ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
