import 'package:car_rental/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.value, this.onChanged});
  final bool value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      width: 24.0,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

        fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.kPrimaryColor;
          }
          return AppColors.kWhiteColor;
        }),
        side: BorderSide(color: AppColors.kStokeColor),
      ),
    );
  }
}
