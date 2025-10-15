import 'package:car_rental/Feature/car_details/presentation/components/reviews_view_body.dart';
import 'package:car_rental/Feature/car_details/presentation/manager/car_review/car_reviewes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsViewBodyBlocBuilder extends StatelessWidget {
  const ReviewsViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarReviewesCubit, CarReviewesState>(
      builder: (context, state) {
        if (state is CarReviewesFailure) {
          return Center(child: Text(state.message));
        } else if (state is CarReviewesLoaded) {
          if (state.reviews.isEmpty) {
            return const Center(child: Text('No reviews available.'));
          }
          return ReviewsViewBody(reviews: state.reviews);
        } else {
          return const LoadingReviewesViewBody();
        }
      },
    );
  }
}
