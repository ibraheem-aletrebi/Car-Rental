import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
  });
  final String text;
  final void Function()? onPressed;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? AppColors.kPrimaryColor,
        minimumSize: Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(62)),
        side: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
      ),
      onPressed: onPressed,
      child: Text(text, style: AppStyles.bold18.copyWith(color: textColor)),
    );
  }
}
