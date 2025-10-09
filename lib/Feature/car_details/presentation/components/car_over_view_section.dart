import 'package:car_rental/Feature/car_details/presentation/manager/car_details/car_details_cubit.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarOverViewSection extends StatelessWidget {
  const CarOverViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    var car = context.read<CarDetailsCubit>().car;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.name,
                style: AppStyles.semiBold16.copyWith(fontSize: 20.sp),
              ),
              SizedBox(height: 6.h),
              Text(
                car.description,
                style: AppStyles.regular14.copyWith(
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),

        WidthSpace(),
        Column(
          children: [
            Row(
              children: [
                Text(
                  car.averageRate.toString(),
                  style: AppStyles.semiBold16.copyWith(fontSize: 18.sp),
                ),
                SizedBox(width: 5),
                const Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.amber,
                  size: 18,
                ),
              ],
            ),
            Text(
              '(${car.reviewsCount}+Reviews)',
              style: AppStyles.regular14.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }
}
