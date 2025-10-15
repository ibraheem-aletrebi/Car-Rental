import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  ConnectivityController._();
  static final ConnectivityController _instance = ConnectivityController._();
  factory ConnectivityController() => _instance;

  ValueNotifier<bool> isConnected = ValueNotifier<bool>(true);

  Future<void> init() async {
    // فحص أولي
    final connectivityResultList = await Connectivity().checkConnectivity();
    isConnected.value = await hasInternet(connectivityResultList);

    // الاستماع للتغيرات
    Connectivity().onConnectivityChanged.listen((connectivityResultList) async {
      isConnected.value = await hasInternet(connectivityResultList);
    });
  }

  Future<bool> hasInternet(List<ConnectivityResult> connectivityResult) async {
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
