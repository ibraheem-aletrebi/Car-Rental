import 'package:car_rental/Feature/auth/manager/reset_password/password_reset_controller.dart';
import 'package:car_rental/core/utils/helper/validator.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetNewPasswordFormSection extends StatelessWidget {
  const ResetNewPasswordFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PasswordResetController.get(context);
    return Form(
      key: controller.resetFormKey,
      autovalidateMode: controller.autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Password',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => Validator.password(value),
            onSaved: (value) => controller.password = value!,
          ),
          HeightSpace(height: 28),

          CustomTextFormField(
            validator: (value) =>
                Validator.confirmPassword(value, controller.password),
            onSaved: (value) => controller.confirmPassword = value!,
            hintText: 'Confirm Password',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          HeightSpace(height: 28),
          CustomButton(
            text: 'Reset Password',
            isLoading:
                context.watch<PasswordResetController>().state
                    is PasswordResetLoadingState,
            onPressed: () async {
              controller.resetFormKey.currentState!.save();
              if (controller.resetFormKey.currentState!.validate()) {
                await context.read<PasswordResetController>().resetPassword();
              } else {
                controller.updateAutovalidateMode(AutovalidateMode.always);
              }
            },
          ),
        ],
      ),
    );
  }
}
