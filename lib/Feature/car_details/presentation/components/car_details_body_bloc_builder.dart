import 'package:car_rental/Feature/car_details/presentation/components/car_details_view_body.dart';
import 'package:car_rental/Feature/car_details/presentation/manager/car_details/car_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CarDetailsBodyBlocBuilder extends StatelessWidget {
  const CarDetailsBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarDetailsCubit, CarDetailsState>(
      builder: (context, state) {
        if (state is CarDetailsErrorState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is CarDetailsLoadedState) {
          return CarDetailsViewBody();
        } else {
          return Center(child: Lottie.asset('assets/lottie/car_loading.json'));
        }
      },
    );
  }
}
