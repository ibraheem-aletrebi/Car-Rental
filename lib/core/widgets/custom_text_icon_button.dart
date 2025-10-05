import 'package:car_rental/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelected;

  const CustomTextIconButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: isSelected ? Colors.white : Colors.black),
      label: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        backgroundColor: isSelected ? AppColors.kPrimaryColor : Colors.white,
        side: BorderSide(
          color: isSelected ? AppColors.kPrimaryColor : Colors.grey,
          width: 2,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
