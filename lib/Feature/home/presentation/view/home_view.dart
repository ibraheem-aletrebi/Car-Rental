import 'package:car_rental/Feature/home/domain/repos/home_repo.dart';
import 'package:car_rental/Feature/home/presentation/components/home_view_body.dart';
import 'package:car_rental/Feature/home/presentation/manager/best_car_cubit/best_car_cubit.dart';
import 'package:car_rental/Feature/home/presentation/manager/brand_cubit/brands_cubit.dart';
import 'package:car_rental/Feature/home/presentation/manager/nearby_cars_cubit/nearby_cars_cubit.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BrandsCubit(homeRepo: getIt<HomeRepo>())..fetchBrands(),
        ),
        BlocProvider(
          create: (context) =>
              BestCarCubit(homeRepo: getIt<HomeRepo>())..fetchBestCars(),
        ),
 
        BlocProvider(
          create: (context) =>
              NearbyCarsCubit(homeRepo: getIt<HomeRepo>())..fetchNearbyCars(),
        ),
      ],

      child: Scaffold(body: SafeArea(child: HomeViewBody())),
    );
  }
}
