import 'package:flutter/material.dart';
import 'package:car_rental/Feature/car_details/presentation/components/car_features_section.dart';
import 'package:car_rental/Feature/car_details/presentation/components/car_over_view_section.dart';
import 'package:car_rental/Feature/car_details/presentation/components/owner_info_section.dart';
import 'package:car_rental/Feature/car_details/presentation/components/reviews_section.dart';
import 'package:car_rental/core/widgets/height_space.dart';

class CarDetailsBodyContent extends StatelessWidget {
  const CarDetailsBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeightSpace(),
        const CarOverViewSection(),
        const HeightSpace(),
        const Divider(),
        const HeightSpace(),
        const OwnerInfoSection(),
        const HeightSpace(),
        const CarFeaturesSection(),
        const HeightSpace(),
        const ReviewsSection(),
        HeightSpace(height: 90),
      ],
    );
  }
}
