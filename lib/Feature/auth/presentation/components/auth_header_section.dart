import 'package:car_rental/Feature/auth/presentation/components/custom_logo.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class AuthHeaderSection extends StatelessWidget {
  const AuthHeaderSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLogo(),
        HeightSpace(height: 50),
        Text(title, style: AppStyles.semiBold30),
      ],
    );
  }
}
