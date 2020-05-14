import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:youthetree/emaos/action/tree_action.dart';
import 'package:youthetree/emaos/observable/location_observable.dart';
import 'package:youthetree/emaos/observable/tree_marker_observable.dart';

const double kCameraZoom = 15.0;

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  LocationData currentLocation;


  @override
  void initState() {
    super.initState();
    TreeAction.of(context).refreshTreeMarkers();
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation != null) {
      CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: kCameraZoom,
      );
    }
    return Consumer2<LocationObservable, TreeMarkerSetObservable>(
      builder: (context, location, treeMarkers, __) {
        var currentLocationMarker = Marker(
            markerId: MarkerId("current location"),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            rotation: pi / 4,
            alpha: 0.7,
            position: LatLng(location.latitude, location.longitude));

        var treeMarkersSet = treeMarkers.treeMarkers
            .map(
              (e) => Marker(
                  markerId: MarkerId(e.treeId),
                  rotation: -pi / 4,
                  icon: e.isInOurForest
                      ? BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen)
                      : BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueOrange),
                  position: LatLng(e.location.latitude, e.location.longitude)),
            )
            .toSet();
        Set<Marker> allMarkers =
            Set.from([...treeMarkersSet, currentLocationMarker]);

        return GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(location.latitude, location.longitude),
            zoom: kCameraZoom,
          ),
          markers: allMarkers,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            showPinOnMap();
          },
        );
      },
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
  }
}
