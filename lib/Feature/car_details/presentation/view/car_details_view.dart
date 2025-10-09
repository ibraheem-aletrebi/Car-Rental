import 'package:car_rental/Feature/car_details/domain/repo/car_details_repo.dart';
import 'package:car_rental/Feature/car_details/presentation/components/car_details_body_bloc_builder.dart';
import 'package:car_rental/Feature/car_details/presentation/manager/car_details/car_details_cubit.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key, required this.carId});
  final int carId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CarDetailsCubit(getIt<CarDetailsRepo>())..getCarDetails(carId),
      child: Scaffold(body: SafeArea(child: CarDetailsBodyBlocBuilder())),
    );
  }
}
