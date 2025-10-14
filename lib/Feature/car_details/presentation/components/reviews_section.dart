import 'package:car_rental/Feature/car_details/presentation/components/car_details_review_list.dart';
import 'package:car_rental/Feature/car_details/presentation/components/reviews_section_header.dart';
import 'package:car_rental/Feature/car_details/presentation/manager/car_details/car_details_cubit.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final carReviews = context.read<CarDetailsCubit>().car.reviews;

    return Column(
      children: [
        const ReviewsSectionHeader(),
        HeightSpace(),
        if (carReviews.isEmpty)
          Center(
            child: Text(
              'No Reviews Yet',
              style: AppStyles.regular12.copyWith(fontSize: 18.sp),
            ),
          )
        else
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.18,
            child: CarDetailsReviewList(reviews: carReviews),
          ),
      ],
    );
  }
}
