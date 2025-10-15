import 'package:car_rental/Feature/profile/presentation/components/profile_app_bar.dart';
import 'package:car_rental/Feature/profile/presentation/components/profile_header.dart';
import 'package:car_rental/Feature/profile/presentation/components/setting_section.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileAppBar(),
          HeightSpace(height: 20),
          Divider(color: AppColors.kStokeColor),
          HeightSpace(),
          ProfileHeader(),
          HeightSpace(),
         SettingSection(),
          HeightSpace(height: 120),
        ],
      ),
    );
  }
}
