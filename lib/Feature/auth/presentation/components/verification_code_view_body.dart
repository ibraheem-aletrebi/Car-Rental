import 'package:car_rental/Feature/auth/presentation/components/custom_logo.dart';
import 'package:car_rental/Feature/auth/presentation/components/redirect_text.dart';
import 'package:car_rental/Feature/auth/presentation/components/custom_otp_input.dart';
import 'package:car_rental/Feature/auth/presentation/components/title_subtitle_section.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class VerificationCodeViewBody extends StatelessWidget {
  const VerificationCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
CustomLogo(),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                // physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TitleSubtitleSection(
                      title: 'Enter verification code',
                      subTitle: 'We have send a Code to : +100******00',
                    ),
                    HeightSpace(height: 40),
                    CustomOtpInput(),
                    HeightSpace(height: 28),
                    CustomButton(text: 'Continue', onPressed: () {}),
                    HeightSpace(height: 28),
                    RedirectText(
                      message: 'Didn’t receive the OTP? ',
                      actionText: 'Resend.',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
