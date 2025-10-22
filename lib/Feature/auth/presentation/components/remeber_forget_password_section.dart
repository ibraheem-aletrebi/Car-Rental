import 'package:car_rental/Feature/auth/presentation/components/remeber_me.dart';
import 'package:car_rental/core/resources/app_strings_keys.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RemeberForgetPasswordSection extends StatelessWidget {
  const RemeberForgetPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RemeberMe(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.kResetPasswordStepsView);
          },
          child: Text(
            context.tr(AppStringsKeys.forgetPassword),
            style: AppStyles.regular16.copyWith(color: AppColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
