import 'package:car_rental/Feature/car_details/presentation/components/loading_review_card.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingReviewsSliverListBuilder extends StatelessWidget {
  const LoadingReviewsSliverListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => const LoadingReviewCard(),
      separatorBuilder: (context, index) => HeightSpace(height: 10.h),
      itemCount: 10,
    );
  }
}
