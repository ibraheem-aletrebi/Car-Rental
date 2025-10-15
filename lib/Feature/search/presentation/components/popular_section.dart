import 'package:car_rental/Feature/home/presentation/components/section_header.dart';
import 'package:car_rental/Feature/search/presentation/components/popular_item.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        children: [
          SectionHeader(
            title: 'Our Popular Cars',
            actionText: 'View All',
            onActionPressed: () {},
          ),
          HeightSpace(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .12,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => WidthSpace(),
              itemBuilder: (BuildContext context, int index) {
                return PopularItem();
              },
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}
