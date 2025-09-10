import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class ResetNewPasswordFormSection extends StatelessWidget {
  const ResetNewPasswordFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Password',
          isPassword: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        HeightSpace(height: 28),

        CustomTextFormField(
          hintText: 'Confirm Password',
          isPassword: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        HeightSpace(height: 28),
        CustomButton(
          text: 'Reset Password',
          onPressed: () {
            Navigator.pushNamed(context, Routes.kResetPasswordSuccessView);
          },
        ),
      ],
    );
  }
}
