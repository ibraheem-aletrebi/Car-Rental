import 'package:car_rental/Feature/auth/presentation/components/custom_logo.dart';
import 'package:car_rental/Feature/auth/presentation/components/redirect_text.dart';
import 'package:car_rental/Feature/auth/presentation/components/title_subtitle_section.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

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
                      title: 'Reset your password',
                      subTitle:
                          'Enter the email address associated with your account and we\'ll send you a link to reset your password.',
                    ),
                    HeightSpace(height: 40),
                    CustomTextFormField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    HeightSpace(height: 28),
                    CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.kVerifyPhoneNumberView,
                        );
                      },
                    ),
                    HeightSpace(height: 28),
                    RedirectText(
                      message: 'Back to ',
                      actionText: 'Sign In',
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          ),

          RedirectText(
            message: 'Create a ',
            actionText: 'New Account',
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.kSignUpView);
            },
          ),
        ],
      ),
    );
  }
}
