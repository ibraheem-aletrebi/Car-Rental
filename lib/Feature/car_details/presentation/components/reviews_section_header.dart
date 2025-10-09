import 'package:car_rental/Feature/car_details/presentation/manager/car_details/car_details_cubit.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsSectionHeader extends StatelessWidget {
  const ReviewsSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var car = context.read<CarDetailsCubit>().car;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reviews (${car.reviews.length})',
          style: AppStyles.semiBold16.copyWith(fontSize: 18.sp),
        ),

        Text(
          'See All',
          style: AppStyles.regular14.copyWith(color: AppColors.kPrimaryColor),
        ),
      ],
    );
  }
}
