import 'package:car_rental/Feature/car_details/presentation/components/car_details_view_body.dart';
import 'package:flutter/material.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key, required this.carId});
  final int carId; 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: CarDetailsViewBody()));
  }
}
