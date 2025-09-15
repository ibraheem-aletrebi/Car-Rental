import 'dart:developer';

import 'package:car_rental/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomOtpInput extends StatefulWidget {
  const CustomOtpInput({super.key, this.onCompleted});
final void Function(String)? onCompleted;
  @override
  State<CustomOtpInput> createState() => _CustomOtpInputState();
}

class _CustomOtpInputState extends State<CustomOtpInput> {
  late PinTheme defaultPinTheme, focusedPinTheme;
  @override
  void initState() {
    defaultPinTheme = buildDefaultPinTheme();
    focusedPinTheme = buildFocusedPinTheme(defaultPinTheme);
    super.initState();
  }

  PinTheme buildFocusedPinTheme(PinTheme defaultPinTheme) {
    return defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.kSecondaryColor, width: 2),
      borderRadius: BorderRadius.circular(8),
    );
  }

  PinTheme buildDefaultPinTheme() {
    return PinTheme(
      width: 65,
      height: 65,
      textStyle: TextStyle(
        fontSize: 20,
        color: AppColors.kPrimaryColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        border: Border.all(color: AppColors.kStokeColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      onCompleted: widget.onCompleted,
      
    );
  }
}
