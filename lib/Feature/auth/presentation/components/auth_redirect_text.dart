import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthRedirectText extends StatelessWidget {
  const AuthRedirectText({
    super.key,
    required this.message,
    required this.actionText,
    required this.onTap,
  });
  final String message;
  final String actionText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: message, style: AppStyles.regular14),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: actionText,
            style: AppStyles.semiBold14.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
