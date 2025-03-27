import 'package:connectivity_plus/connectivity_plus.dart';

class CheckInternet {
  static bool isConnected(ConnectivityResult? connectivityResult) {
    bool isInternet = false;
    if (connectivityResult == ConnectivityResult.mobile) {
      isInternet = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isInternet = true;
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      isInternet = true;
    } else if (connectivityResult == ConnectivityResult.none) {
      isInternet = false;
    }else{
      isInternet = false;
    }
    return isInternet;
  }
}
