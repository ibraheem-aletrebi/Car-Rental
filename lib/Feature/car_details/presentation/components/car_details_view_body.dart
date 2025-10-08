import 'package:car_rental/Feature/car_details/presentation/components/car_details_sliver_app_bar.dart';
import 'package:car_rental/Feature/car_details/presentation/components/car_features_section.dart';
import 'package:car_rental/Feature/car_details/presentation/components/car_images.dart';
import 'package:car_rental/Feature/car_details/presentation/components/car_over_view_section.dart';
import 'package:car_rental/Feature/car_details/presentation/components/owner_info_section.dart';
import 'package:car_rental/Feature/car_details/presentation/components/reviews_section.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetailsViewBody extends StatelessWidget {
  const CarDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        CarDetailsSliverAppBar(),
        SliverToBoxAdapter(child: CarImages()),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSpace(),
                CarOverViewSection(),
                HeightSpace(),
                const Divider(),
                HeightSpace(),
                OwnerInfoSection(),
                HeightSpace(),
                CarFeaturesSection(),
                HeightSpace(),
                ReviewsSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
