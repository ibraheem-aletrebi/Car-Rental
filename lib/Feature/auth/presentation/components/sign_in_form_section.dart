import 'package:car_rental/Feature/auth/presentation/components/remeber_forget_password_section.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class SignInFormSection extends StatelessWidget {
  const SignInFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(hintText: 'Email/Phone Number'),
        HeightSpace(),
        CustomTextFormField(
          hintText: 'Password',
          isPassword: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        HeightSpace(height: 30),
        RemeberForgetPasswordSection(),
        HeightSpace(height: 30),
        CustomButton(text: 'Sign In', onPressed: () {}),
        HeightSpace(),
        CustomButton(
          textColor: AppColors.kPrimaryColor,
          borderColor: AppColors.kPrimaryColor,
          backgroundColor: AppColors.kStokeColor,
          text: 'Sign Up',
          onPressed: () {
            Navigator.pushNamed(context, Routes.kSignUpView);
          },
        ),
      ],
    );
  }
}
