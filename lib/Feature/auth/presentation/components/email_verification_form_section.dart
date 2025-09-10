import 'package:car_rental/Feature/auth/presentation/components/custom_otp_input.dart';
import 'package:car_rental/Feature/auth/presentation/components/redirect_text.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class EmailVerificationFormSection extends StatelessWidget {
  const EmailVerificationFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOtpInput(),
        HeightSpace(height: 40),
        CustomButton(
          text: 'Continue',
          onPressed: () {
            Navigator.pushNamed(context, Routes.kResetNewPasswordView);
          },
        ),
        HeightSpace(height: 30),
        RedirectText(
          message: 'Didn’t receive the OTP?',
          actionText: 'Resend.',
          onTap: () {},
        ),
      ],
    );
  }
}
