import 'package:car_rental/Feature/auth/presentation/components/email_verification_form_section.dart';
import 'package:car_rental/Feature/auth/presentation/components/title_subtitle_section.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class EmailCodeVerifyStep extends StatelessWidget {
  const EmailCodeVerifyStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}