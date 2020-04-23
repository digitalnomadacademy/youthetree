import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

const LatLng SOURCE_LOCATION =
LatLng(44.870, 13.870); // cca koordinate N i E za Pulu
const double CAMERA_ZOOM = 18;

class YttMapWidget extends StatefulWidget {
  @override
  _YttMapWidgetState createState() => _YttMapWidgetState();
}

class _YttMapWidgetState extends State<YttMapWidget> {
  Completer<GoogleMapController> _controller = Completer();
  LocationData currentLocation;
  Location location;

  @override
  void initState() {
    super.initState();

    location = new Location();

    location.onLocationChanged.listen((LocationData cLoc) {
      currentLocation = cLoc;
      updatePinOnMap();
    });
    setInitialLocation();
  }

  void setInitialLocation() async {
    currentLocation = await location.getLocation();
  }

  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: SOURCE_LOCATION,
      zoom: CAMERA_ZOOM,
    );
    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: CAMERA_ZOOM,
      );
    }
    return MaterialApp(
      home: Scaffold(
          body: GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition: initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                showPinOnMap();
              })),
    );
  }

  void showPinOnMap() {
    var pinPosition =
    LatLng(currentLocation.latitude, currentLocation.longitude);
    updatePinOnMap();
  }

  void updatePinOnMap() async {
    CameraPosition cPosition = CameraPosition(
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
      zoom: CAMERA_ZOOM,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    setState(() {
      var pinPosition =
      LatLng(currentLocation.latitude, currentLocation.longitude);
    });
  }
}
