import 'package:car_rental/Feature/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
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
    var controller = ForgotPasswordCubit.get(context);
    return Form(
      key: controller.formKey,
      autovalidateMode: controller.autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Password',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => Validator.password(value),
            onSaved: (value) => controller.updatePassword(value!),
          ),
          HeightSpace(height: 28),

          CustomTextFormField(
            validator: (value) =>
                Validator.confirmPassword(value, controller.password),
            onSaved: (value) => controller.updateConfirmPassword(value!),
            hintText: 'Confirm Password',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          HeightSpace(height: 28),
          CustomButton(
            text: 'Reset Password',
            isLoading:
                context.watch<ForgotPasswordCubit>().state
                    is ForgotPasswordLoading,
            onPressed: () async {
              controller.formKey.currentState!.save();
              if (controller.formKey.currentState!.validate()) {
                await context.read<ForgotPasswordCubit>().resetPassword();
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
