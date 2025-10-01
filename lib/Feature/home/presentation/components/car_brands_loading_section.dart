import 'package:car_rental/Feature/home/presentation/components/car_brand_item_loading.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarBrandsLoadingSection extends StatelessWidget {
  const CarBrandsLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        const HeightSpace(),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 12,
            itemBuilder: (context, index) => const CarBrandItemLoading(),
          ),
        ),
      ],
    );
  }
}
