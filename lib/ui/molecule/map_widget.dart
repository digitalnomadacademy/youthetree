import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:youthetree/emaos/observable/location_observable.dart';

const double kCameraZoom = 15.0;

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  LocationData currentLocation;
  final Map<String, Marker> _markers = {};


  @override
  Widget build(BuildContext context) {
    if (currentLocation != null) {
      CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: kCameraZoom,
      );
    }
    return Consumer<LocationObservable>(
      builder:(context,location,__)=> GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            location.latitude,
            location.longitude
          ),
          zoom: kCameraZoom,
        ),
        markers: _markers.values.toSet(),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          showPinOnMap();
        },
      ),
    );
  }

  void showPinOnMap() async {
    if (currentLocation == null) {
      return;
    }
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
