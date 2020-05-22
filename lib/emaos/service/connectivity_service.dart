import 'package:connectivity/connectivity.dart';

class ConnectivityService {
  Future<bool>  isConnected() async {
    ConnectivityResult connection = await Connectivity().checkConnectivity();
    return connection == ConnectivityResult.none ? false : true;
  }
}
