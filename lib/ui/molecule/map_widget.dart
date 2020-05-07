import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

const LatLng kSourceLocation =
    LatLng(44.87, 13.86); // cca koordinate N i E za Pulu
const double kCameraZoom = 15.0;

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  LocationData currentLocation;
  Location location;
  final Map<String, Marker> _markers = {};

  CameraPosition initialCameraPosition = CameraPosition(
    target: kSourceLocation,
    zoom: kCameraZoom,
  );

  @override
  void initState() {
    super.initState();
    location = new Location();

    location.onLocationChanged.listen((LocationData cLoc) {
      currentLocation = cLoc;
      showPinOnMap();
    });
    setInitialLocation();
  }

  void setInitialLocation() async {
    currentLocation = await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation != null) {
      CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: kCameraZoom,
      );
    }
    return GoogleMap(
      myLocationEnabled: true,
      mapType: MapType.hybrid,
      initialCameraPosition: initialCameraPosition,
      markers: _markers.values.toSet(),
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
        showPinOnMap();
      },
    );
  }

  void showPinOnMap() async {
    CameraPosition cPosition = CameraPosition(
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
      zoom: kCameraZoom,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    setState(() {
      //_markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: 'My Location'),
      );
      _markers["Current Location"] = marker;
    });
  }
}
