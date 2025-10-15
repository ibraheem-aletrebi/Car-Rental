import 'package:car_rental/Feature/car_details/domain/repo/car_details_repo.dart';
import 'package:car_rental/Feature/car_details/presentation/components/book_car_button.dart';
import 'package:car_rental/Feature/car_details/presentation/components/reviews_view_body_bloc_builder.dart';
import 'package:car_rental/Feature/car_details/presentation/manager/car_review/car_reviewes_cubit.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarReviewsView extends StatelessWidget {
  const CarReviewsView({super.key, required this.carId});
  final int carId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              CarReviewesCubit(carDetailsRepo: getIt<CarDetailsRepo>())
                ..fetchCarReviews(carId: carId),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const ReviewsViewBodyBlocBuilder(),
              const BookCarButton(),
            ],
          ),
        ),
      ),
    );
  }
}
