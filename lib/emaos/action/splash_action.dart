import 'package:flutter/cupertino.dart';
import 'package:youthetree/emaos/service/connectivity_service.dart';
import 'package:youthetree/emaos/service/location_service.dart';
import 'package:youthetree/provider/provider.dart';

class SplashAction {
  final LocationService _locationService;
  final ConnectivityService _connectivityService;

  SplashAction.of(BuildContext context)
      : _locationService = StaticProvider.of(context),
        _connectivityService = StaticProvider.of(context);

  Future<bool> isAppInitialized() async {
    bool location, internet = false;
    if (_locationService.currentLocation != null) {
      location = true;
    }
    internet = await _connectivityService.isConnected();

    return location && internet;
  }
}
