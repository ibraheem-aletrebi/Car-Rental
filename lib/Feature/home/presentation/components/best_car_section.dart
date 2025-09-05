import 'package:car_rental/Feature/home/presentation/components/best_car_item.dart';
import 'package:car_rental/Feature/home/presentation/components/section_header.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';

class BestCarsSection extends StatelessWidget {
  const BestCarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Best Cars',
          actionText: 'View All',
          onActionPressed: () {},
        ),
        HeightSpace(),
        Text('Available', style: AppStyles.regular12),
        HeightSpace(height: 18),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .28,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => BestCarItem(),
            separatorBuilder: (context, index) => WidthSpace(),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
