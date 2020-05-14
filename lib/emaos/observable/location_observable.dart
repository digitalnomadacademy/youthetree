class LocationObservable {
  /// Latitude in degrees
  final double latitude;

  /// Longitude, in degrees
  final double longitude;

  /// Estimated horizontal accuracy of this location, radial, in meters
  ///
  /// Always 0 on Web
  final double accuracy;

  /// In meters above the WGS 84 reference ellipsoid
  ///
  /// Always 0 on Web
  final double altitude;

  const LocationObservable({
    this.latitude = 44.87,
    this.longitude = 13.86,
    this.accuracy = 0,
    this.altitude = 0,
  });

  @override
  String toString() {
    return 'LocationObservable{latitude: $latitude, longitude: $longitude}';
  }
}
