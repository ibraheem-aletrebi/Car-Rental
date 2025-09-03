import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewAppBar extends StatelessWidget {
  const SearchViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            onPressed: () {},
            icon: Icons.arrow_back_ios_new_rounded,
          ),
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
