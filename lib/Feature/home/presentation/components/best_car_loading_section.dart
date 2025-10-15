import 'package:car_rental/core/widgets/build_box.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/loading_car_card.dart';
import 'package:car_rental/core/widgets/loading_horizontal_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BestCarLoadingSection extends StatelessWidget {
  const BestCarLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildBox(height: 12, width: 80),
              buildBox(height: 12, width: 80),
            ],
          ),
          HeightSpace(),
          buildBox(height: 12, width: 80),
          HeightSpace(height: 18),
          LoadingHorizontalListBuilder(
            height: MediaQuery.sizeOf(context).height * .28,
            itemBuilder: const LoadingCarCard(),
          ),
        ],
      ),
    );
  }
}
