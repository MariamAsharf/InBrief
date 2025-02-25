import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class InternetServices {
  InternetServices._internet();

  static final InternetServices _instance = InternetServices._internet();

  factory InternetServices() => _instance;

  final StreamController<bool> _streamControllerConnection =
      StreamController<bool>.broadcast();

  Stream<bool> connectionStream() => _streamControllerConnection.stream;

  final Connectivity _connectivity = Connectivity();

  Future<bool> checkConnectivity() async {
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    return _updateInternetConnection(result);
  }

  bool _updateInternetConnection(List<ConnectivityResult> result) {
    bool isConnected = true;
    for (var data in result) {
      if (data == ConnectivityResult.none) {
        return isConnected = false;
      }
    }
    debugPrint("Has Internet: $isConnected");
    return isConnected;
  }

  void init() {
    _connectivity.onConnectivityChanged.listen(
      (event) {
        _updateInternetConnection(event);
      },
    );
  }
}
