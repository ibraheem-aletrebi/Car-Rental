import 'package:car_rental/Feature/home/presentation/components/section_header.dart';
import 'package:car_rental/Feature/search/presentation/components/recommended_item.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        children: [
          SectionHeader(
            title: 'Recommend',
            actionText: 'See All',
            onActionPressed: () {},
          ),
          HeightSpace(),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 5,
              childAspectRatio: .65,
            ),
            itemBuilder: (BuildContext context, int index) {
              return RecommendedItem();
            },
            itemCount: 4,
          ),
        ],
      ),
    );
  }
}
