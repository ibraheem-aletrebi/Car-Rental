import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthHeaderSection extends StatelessWidget {
  const AuthHeaderSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(Assets.imagesLightLogo, width: 105),
        HeightSpace(height: 50),
        Text(title, style: AppStyles.semiBold30),
      ],
    );
  }
}
