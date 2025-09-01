import 'package:car_rental/Feature/auth/presentation/components/country_drop_down_button.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(hintText: 'Full Name'),
        HeightSpace(),
        CustomTextFormField(hintText: 'Email/Phone Number'),
        HeightSpace(),
        CustomTextFormField(
          hintText: 'Password',
          isPassword: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        HeightSpace(),
        CountryDropDownButton(),
        HeightSpace(height: 30),
        CustomButton(text: 'Sign up', onPressed: () {}),
        HeightSpace(),
        CustomButton(
          textColor: AppColors.kPrimaryColor,
          borderColor: AppColors.kPrimaryColor,
          backgroundColor: AppColors.kStokeColor,
          text: 'Sign In',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
