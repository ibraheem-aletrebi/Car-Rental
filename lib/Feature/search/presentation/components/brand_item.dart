import 'package:car_rental/Feature/search/domain/entities/brand_entity.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
    required this.isSelected,
    required this.brandEntity,
  });
  final bool isSelected;
  final BrandEntity brandEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: isSelected
            ? SelectedBrandItem(brandEntity: brandEntity)
            : UnSelectedBrandItem(brandEntity: brandEntity),
      ),
    );
  }
}

class UnSelectedBrandItem extends StatelessWidget {
  const UnSelectedBrandItem({super.key, required this.brandEntity});
  final BrandEntity brandEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CircleAvatar(
          radius: 16.r,
          backgroundImage: AssetImage(brandEntity.image),
        ),
        Text(brandEntity.name, style: AppStyles.semiBold12),
      ],
    );
  }
}

class SelectedBrandItem extends StatelessWidget {
  const SelectedBrandItem({super.key, required this.brandEntity});
  final BrandEntity brandEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60.r),
        color: AppColors.kPrimaryColor,
      ),
      child: Row(
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundImage: AssetImage(brandEntity.image),
          ),
          Text(
            brandEntity.name,
            style: AppStyles.semiBold12.copyWith(color: AppColors.kWhiteColor),
          ),
        ],
      ),
    );
  }
}
