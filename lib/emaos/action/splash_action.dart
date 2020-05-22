import 'package:flutter/cupertino.dart';
import 'package:youthetree/emaos/service/auth_service.dart';
import 'package:youthetree/emaos/service/connectivity_service.dart';
import 'package:youthetree/emaos/service/local_storage_service.dart';
import 'package:youthetree/emaos/service/location_service.dart';
import 'package:youthetree/logger/logger.dart';
import 'package:youthetree/provider/provider.dart';

class SplashAction {
  final LocationService _locationService;
  final ConnectivityService _connectivityService;
  final LocalStorageService _localStorageService;
  final AuthService _authService;

  SplashAction(this._locationService, this._connectivityService,
      this._localStorageService, this._authService);

  factory SplashAction.of(BuildContext context) => SplashAction(
        StaticProvider.of(context),
        StaticProvider.of(context),
        StaticProvider.of(context),
        StaticProvider.of(context),
      );

  Future<bool> isAppInitialized() async {
    bool location = false, internet = false;
    if (_locationService.currentLocation != null) {
      location = true;
    }
    internet = (await _connectivityService.isConnected()) ?? false;

    return location && internet;
  }

  Future<bool> isFirstTime() async {
    bool firstTime =
        await _localStorageService.readJSON(LocalStorageKeys.firstTime);
    if (firstTime == null || firstTime) {
      _localStorageService.addJSON(LocalStorageKeys.firstTime, false);
      l.info("adding flag for first time to local storage");
      return true;
    } else {
      return false;
    }
  }

  bool isLoggedIn() {
    l.info("is logged in being checked. uid is ${_authService.uid}");
    return _authService.isLoggedIn;
  }
}
