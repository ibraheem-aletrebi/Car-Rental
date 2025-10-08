import 'package:car_rental/Feature/car_details/presentation/components/car_details_review_list.dart';
import 'package:car_rental/Feature/car_details/presentation/components/reviews_section_header.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReviewsSectionHeader(),
        HeightSpace(),
        // Reviews List
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.2,
          child: CarDetailsReviewList(),
        ),
      ],
    );
  }
}
