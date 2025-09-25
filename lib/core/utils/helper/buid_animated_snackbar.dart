import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

/// Reusable function to show AnimatedSnackBar
void showAnimatedSnackBar({
  required BuildContext context,
  required String message,
  AnimatedSnackBarType type = AnimatedSnackBarType.info,
  double topOnAppearance = 100,
}) {
  AnimatedSnackBar.material(
    message,
    type: type,
    mobilePositionSettings: MobilePositionSettings(
      topOnAppearance: topOnAppearance,
    ),
  ).show(context);
}
