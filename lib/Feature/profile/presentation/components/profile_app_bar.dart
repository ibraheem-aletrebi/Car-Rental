import 'package:car_rental/Feature/auth/presentation/components/custom_logo.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(child: CustomLogo()),
          Text(
            'Profile',
            style: AppStyles.bold18.copyWith(color: AppColors.kPrimaryColor),
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: CustomIconButton(
                onPressed: () {},
                icon: FontAwesomeIcons.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
