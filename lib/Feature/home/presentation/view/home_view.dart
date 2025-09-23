import 'package:car_rental/Feature/home/domain/repos/home_repo.dart';
import 'package:car_rental/Feature/home/presentation/components/home_view_body.dart';
import 'package:car_rental/Feature/home/presentation/manager/cubit/brands_cubit.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BrandsCubit(homeRepo: getIt<HomeRepo>())..fetchBrands(),
      child: Scaffold(body: SafeArea(child: HomeViewBody())),
    );
  }
}
