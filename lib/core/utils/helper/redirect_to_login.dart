import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';

void redirectToLogin() {
  getIt<GlobalKey<NavigatorState>>().currentState?.pushNamedAndRemoveUntil(
    Routes.kSignInView,
    (Route<dynamic> route) => false,
  );
}
