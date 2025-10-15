import 'package:car_rental/core/widgets/build_box.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/loading_horizontal_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CarBrandsLoadingSection extends StatelessWidget {
  const CarBrandsLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildBox(
            height: 12.h,
            width: 80.w,
            borderRadius: BorderRadius.circular(12.r),
          ),
          const HeightSpace(),
          LoadingHorizontalListBuilder(
            itemBuilder: Column(
              children: [
                buildBox(shape: BoxShape.circle, height: 80.h, width: 80.h),
                const HeightSpace(),
                buildBox(
                  height: 12.h,
                  width: 60.w,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ],
            ),
            height: MediaQuery.sizeOf(context).height * .1,
          ),
        ],
      ),
    );
  }
}
