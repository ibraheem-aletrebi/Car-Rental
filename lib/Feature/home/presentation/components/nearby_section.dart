import 'package:car_rental/Feature/home/presentation/components/nearby_item.dart';
import 'package:car_rental/Feature/home/presentation/components/section_header.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';

class NearbySection extends StatelessWidget {
  const NearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Nearby ',
          actionText: 'View All',
          onActionPressed: () {},
        ),
        HeightSpace(),
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 7.5,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                NearbyItem(imagePath: Assets.imagesFerrariCar),
            separatorBuilder: (context, index) => WidthSpace(),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
