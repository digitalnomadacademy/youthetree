import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

class LocationService {
  BehaviorSubject<LocationData> location$ = BehaviorSubject();
  LocationData get currentLocation => location$?.value ?? null;

  Location location;

  LocationService() {
    _init();
  }
  _init() async {
    location = new Location();
    location.onLocationChanged.listen(_onLocationChanged);

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    print("initial location data $locationData");
    _updateLocationStream(locationData);
  }

  void _onLocationChanged(LocationData location) {
    _updateLocationStream(location);
  }

  void _updateLocationStream(LocationData location) {
    location$.add(location);
  }
}
