import 'package:car_rental/app/car_rental.dart';
import 'package:car_rental/core/services/local_services/preference_manager.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManegar().init();
  setUpServiceLocator();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => CarRental(), // Wrap your app
    ),
  );
  // runApp(const CarRental());
}
