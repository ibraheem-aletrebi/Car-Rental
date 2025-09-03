import 'package:car_rental/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    this.iconPath,
    this.backgroundColor,
    this.padding,
    this.iconColor,
    this.iconSize,
    this.icon,
  });
  final void Function()? onPressed;
  final String? iconPath;
  final Color? backgroundColor;
  final double? padding;
  final Color? iconColor;
  final double? iconSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      style: IconButton.styleFrom(
        padding: EdgeInsets.all(padding ?? 10),
        backgroundColor: backgroundColor ?? Colors.transparent,
        minimumSize: Size(40.w, 40.h),
        side: const BorderSide(color: AppColors.kStokeColor, width: 2),
        shape: CircleBorder(),
      ),
      onPressed: onPressed,
      icon: icon == null
          ? iconPath == null
                ? const SizedBox.shrink()
                : SvgPicture.asset(
                    iconPath!,
                    colorFilter: iconColor == null
                        ? null
                        : ColorFilter.mode(iconColor!, BlendMode.srcIn),
                    width: iconSize,
                  )
          : Icon(icon, color: iconColor),
    );
  }
}
