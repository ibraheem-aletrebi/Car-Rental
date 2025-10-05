import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Expanded(child: Divider()),
        Text(
          'Or',
          style: AppStyles.regular16.copyWith(color: AppColors.kSecondaryColor),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
