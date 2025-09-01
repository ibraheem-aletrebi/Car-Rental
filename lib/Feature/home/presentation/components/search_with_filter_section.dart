import 'package:car_rental/Feature/home/presentation/components/car_brands.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:car_rental/core/widgets/custom_icon_button.dart';
import 'package:car_rental/core/widgets/custom_text_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchWithFilterBar extends StatelessWidget {
  const SearchWithFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: 'Search your dream car.....',
                  prefixIcon: SvgPicture.asset(Assets.iconsSearch, width: 10.w),
                ),
              ),
              WidthSpace(width: 25),
              CustomIconButton(
                onPressed: () {},
                iconPath: Assets.iconsFilter,
                backgroundColor: AppColors.kWhiteColor,
                padding: 14,
              ),
            ],
          ),
          HeightSpace(),
          CarBrands(),
        ],
      ),
    );
  }
}
