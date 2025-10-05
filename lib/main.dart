import 'package:car_rental/app/car_rental.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  runApp(CarRental());
}
