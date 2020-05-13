
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

class LocationService {
  BehaviorSubject<LocationData> location$ = BehaviorSubject();
  LocationData get currentLocation => location$?.value ?? null;

  Location location;

  LocationService() {
    location = new Location();
    location.onLocationChanged.pipe(location$);
  }
}
