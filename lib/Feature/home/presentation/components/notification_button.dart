import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/resources/assets.dart';
import 'package:car_rental/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CustomIconButton(onPressed: () {}, iconPath: Assets.iconsNotifications),
        CircleAvatar(
          radius: 14.r,
          backgroundColor: AppColors.kPrimaryColor,
          child: Text(
            '2',
            style: AppStyles.regular12.copyWith(color: AppColors.kWhiteColor),
          ),
        ),
      ],
    );
  }
}
