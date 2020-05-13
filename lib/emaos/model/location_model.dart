import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:youthetree/emaos/observable/location_observable.dart';
import 'package:youthetree/emaos/service/location_service.dart';

class LocationModel {
  final LocationService _locationService;
  final BehaviorSubject<LocationObservable> location$ = BehaviorSubject();

  LocationModel(this._locationService) {
    _locationService.location$.listen((locationData) {
      location$.add(LocationObservable(
          latitude: locationData.latitude,
          longitude: locationData.longitude,
          accuracy: locationData.accuracy,
          altitude: locationData.altitude));
    });
  }
}
