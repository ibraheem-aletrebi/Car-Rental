import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/widgets/build_box.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingCarCard extends StatelessWidget {
  const LoadingCarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 186.w / 237.h,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.kDarkWhite, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: buildBox(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13.r),
                  topRight: Radius.circular(13.r),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBox(height: 10.h, width: 140.w),
                    buildBox(height: 10.h, width: 70.w),
                    buildBox(height: 10.h, width: 120.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 1, child: buildBox(height: 10.h)),
                        WidthSpace(),
                        Expanded(flex: 2, child: buildBox(height: 10.h)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
