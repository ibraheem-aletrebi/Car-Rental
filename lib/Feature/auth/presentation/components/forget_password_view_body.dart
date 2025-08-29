import 'package:car_rental/Feature/auth/presentation/components/auth_redirect_text.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(Assets.imagesLightLogo, width: 105),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  // physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Reset your password', style: AppStyles.semiBold30),
                      HeightSpace(),
                      Text(
                        'Enter the email address associated with your account and we\'ll send you a link to reset your password.',
                        textAlign: TextAlign.center,
                        style: AppStyles.regular14,
                      ),
                      HeightSpace(height: 40),
                      CustomTextFormField(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      HeightSpace(height: 28),
                      CustomButton(text: 'Continue', onPressed: () {}),
                      HeightSpace(height: 28),
                      AuthRedirectText(
                        message: 'Back to ',
                        actionText: 'Sign In',
                        onTap: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Bottom link
            AuthRedirectText(
              message: 'Create a ',
              actionText: 'New Account',
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.kSignUpView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
