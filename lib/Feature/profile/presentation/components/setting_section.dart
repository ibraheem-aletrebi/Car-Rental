import 'package:car_rental/Feature/profile/presentation/components/general_options_section.dart';
import 'package:car_rental/Feature/profile/presentation/components/support_options_section.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GeneralOptionsSection(),
          HeightSpace(),
          SupportOptionsSection(),
        ],
      ),
    );
  }
}
