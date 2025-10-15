import 'package:car_rental/Feature/car_details/presentation/components/review_card.dart';
import 'package:car_rental/domain/entities/review_entity.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsSliverListBuilder extends StatelessWidget {
  const ReviewsSliverListBuilder({super.key, required this.reviews});

  final List<ReviewEntity> reviews;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => ReviewCard(review: reviews[index]),
      separatorBuilder: (context, index) => HeightSpace(height: 10.h),
      itemCount: reviews.length,
    );
  }
}
