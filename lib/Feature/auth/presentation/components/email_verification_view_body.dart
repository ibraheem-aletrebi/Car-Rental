import 'package:car_rental/Feature/auth/presentation/components/custom_logo.dart';
import 'package:car_rental/Feature/auth/presentation/components/email_verification_form_section.dart';
import 'package:car_rental/Feature/auth/presentation/components/title_subtitle_section.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomLogo(),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TitleSubtitleSection(
                      title: 'Email Verification',
                      subTitle:
                          'Enter the 4-digit verification code send to your email address.',
                    ),
                    HeightSpace(height: 40),
                    EmailVerificationFormSection(),
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
