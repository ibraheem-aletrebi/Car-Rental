import 'package:car_rental/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    this.onTap,
    required this.iconPath,
    required this.isSelected,
  });
  final void Function()? onTap;
  final String iconPath;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.kDarkWhite : Colors.white70,
                BlendMode.srcIn,
              ),
              height: isSelected ? 26.h : 22.h,
              width: isSelected ? 26.w : 22.w,
            ),
          ),
        ),
      ),
    );
  }
}
