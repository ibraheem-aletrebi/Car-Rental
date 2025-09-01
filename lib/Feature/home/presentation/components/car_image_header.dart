import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:car_rental/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarImageHeader extends StatelessWidget {
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const CarImageHeader({
    super.key,
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.kStokeColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
          ),
          child: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
        ),
        CustomIconButton(
          padding: 4.r,
          iconSize: 16.r,
          backgroundColor: isFavorite ? Colors.red : AppColors.kWhiteColor,
          iconColor: isFavorite ? Colors.white : AppColors.kPrimaryColor,
          onPressed: onFavoritePressed,
          iconPath: Assets.iconsFavorate,
        ),
      ],
    );
  }
}
