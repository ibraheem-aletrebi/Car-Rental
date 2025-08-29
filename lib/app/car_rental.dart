
import 'package:car_rental/core/routing/on_generate_route.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';

class CarRental extends StatelessWidget {
  const CarRental({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.kOnboardingView,
    );
  }
}
