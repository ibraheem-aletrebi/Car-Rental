import 'package:car_rental/Feature/car_details/presentation/components/car_reviews_sliver_app_bar.dart';
import 'package:car_rental/Feature/car_details/presentation/components/reviewes_header.dart';
import 'package:car_rental/Feature/car_details/presentation/components/reviews_sliver_list_builder.dart';
import 'package:car_rental/Feature/car_details/presentation/components/reviews_sliver_list_loading.dart';
import 'package:car_rental/core/entities/review_entity.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key, required this.reviews});
  final List<ReviewEntity> reviews;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        CarReviewsSliverAppBar(),
        SliverToBoxAdapter(child: ReviewesHeader()),
        SliverToBoxAdapter(child: HeightSpace(height: 10.h)),
        SliverPadding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 100.h),
          sliver: ReviewsSliverListBuilder(reviews: reviews),
        ),
      ],
    );
  }
}

class LoadingReviewesViewBody extends StatelessWidget {
  const LoadingReviewesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        CarReviewsSliverAppBar(),
        SliverToBoxAdapter(child: LoadingReviewesHeader()),
        SliverToBoxAdapter(child: HeightSpace(height: 10.h)),
        SliverPadding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 100.h),
          sliver: LoadingReviewsSliverListBuilder(),
        ),
      ],
    );
  }
}
