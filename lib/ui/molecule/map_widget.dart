import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

const LatLng SOURCE_LOCATION =
    LatLng(44.87, 13.87); // cca koordinate N i E za Pulu
const double CAMERA_ZOOM = 15.0;

class YttMapWidget extends StatefulWidget {
  @override
  _YttMapWidgetState createState() => _YttMapWidgetState();
}

class _YttMapWidgetState extends State<YttMapWidget> {
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  LocationData currentLocation;
  Location location;
  final Map<String, Marker> _markers = {};

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
        appBar: AppBar(
          title: Center(child: Text('Google Map')),
        ),
        body: GoogleMap(
          myLocationEnabled: true,
          //mapType: MapType.hybrid,
          initialCameraPosition: initialCameraPosition,
          markers: _markers.values.toSet(),
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            showPinOnMap();
          },
        ),
        ),
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
//      var pinPosition =
//      LatLng(currentLocation.latitude, currentLocation.longitude);
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: 'My Location'),
      );
      _markers["Current Location"] = marker;
    });
  }
}
