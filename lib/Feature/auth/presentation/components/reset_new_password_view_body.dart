import 'package:car_rental/Feature/auth/presentation/components/custom_logo.dart';
import 'package:car_rental/Feature/auth/presentation/components/reset_new_password_form_section.dart';
import 'package:car_rental/Feature/auth/presentation/components/title_subtitle_section.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class ResetNewPasswordViewBody extends StatelessWidget {
  const ResetNewPasswordViewBody({super.key});

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
                      title: 'New Password',
                      subTitle:
                          'set new password and you will be able to login to your account',
                    ),
                    HeightSpace(height: 40),
                    ResetNewPasswordFormSection(),
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
