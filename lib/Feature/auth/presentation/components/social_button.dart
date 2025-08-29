import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.socialIconPath,
    required this.socialName, this.onPressed,
  });
  final String socialIconPath;
  final String socialName;
  final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        side: BorderSide(color: Colors.grey.shade400),
        backgroundColor: AppColors.kStokeColor,
        minimumSize: Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(62)),
      ),
      onPressed:onPressed,
      label: Text(socialName, style: AppStyles.semiBold14),
      icon: SvgPicture.asset(socialIconPath),
    );
  }
}
