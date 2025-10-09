import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/widgets/custom_icon_button.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewAppBar extends StatelessWidget {
  const SearchViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const WidthSpace(width: 40),
          Text(
            'Search',
            style: AppStyles.bold18.copyWith(color: AppColors.kPrimaryColor),
          ),
          CustomIconButton(onPressed: () {}, icon: FontAwesomeIcons.ellipsis),
        ],
      ),
    );
  }
}
