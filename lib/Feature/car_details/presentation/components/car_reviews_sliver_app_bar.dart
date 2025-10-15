import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarReviewsSliverAppBar extends StatelessWidget {
  const CarReviewsSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      elevation: 0,
      title: const Text('Reviews', style: TextStyle(color: Colors.black)),
      surfaceTintColor: Colors.transparent,
      leadingWidth: 65.w,
      leading: Center(
        child: CustomIconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icons.arrow_back,
        ),
      ),
      actions: [CustomIconButton(onPressed: () {}, icon: Icons.more_horiz)],
      actionsIconTheme: const IconThemeData(color: Colors.black),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(16.h),
        child: Divider(color: AppColors.kStokeColor, height: 1.h),
      ),
    );
  }
}
