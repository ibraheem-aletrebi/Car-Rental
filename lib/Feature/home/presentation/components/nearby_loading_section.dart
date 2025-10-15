import 'package:car_rental/core/widgets/build_box.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/loading_horizontal_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class NearbyLoadingSection extends StatelessWidget {
  const NearbyLoadingSection({super.key});

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
          LoadingHorizontalListBuilder(
            height: MediaQuery.sizeOf(context).height / 7.5,
            itemBuilder: const NearbyItemLoading(),
          ),
        ],
      ),
    );
  }
}

class NearbyItemLoading extends StatelessWidget {
  const NearbyItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 321 / 121,
      child: buildBox(borderRadius: BorderRadius.all(Radius.circular(16.r))),
    );
  }
}
