import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onSaved,
    this.keyboardType,
    this.prefixIcon,
  });
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onSaved: onSaved,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        
        filled: true,
        fillColor: AppColors.kWhiteColor,
        border: buildBorder(color: Color(0xFF7F7F7F)),
        enabledBorder: buildBorder(color: AppColors.kStokeColor),
        focusedBorder: buildBorder(color: Color(0xFF7F7F7F)),
        errorBorder: buildBorder(color: AppColors.kErrorColor),
        hintText: hintText,
        hintStyle: AppStyles.regular12,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: prefixIcon,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 50,
          minHeight: 40,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
