import 'package:car_rental/Feature/home/presentation/components/bottom_nav_bar_item.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  static final List<String> _icons = [
    Assets.iconsHome,
    Assets.iconsSearch,
    Assets.iconsInbox,
    Assets.iconsNotifications,
    Assets.iconsUser,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 29.h),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(54.r),
      ),
      child: Row(
        children: List.generate(_icons.length, (index) {
          return BottomNavBarItem(
            iconPath: _icons[index],
            onTap: () => onTabSelected(index),
            isSelected: currentIndex == index,
          );
        }),
      ),
    );
  }
}
