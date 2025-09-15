import 'package:car_rental/Feature/auth/data/model/password_reset_response_model.dart';
import 'package:car_rental/Feature/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/services/local_services/preference_manager.dart';
import 'package:car_rental/core/services/local_services/storage_key.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetNewPasswordFormSection extends StatefulWidget {
  const ResetNewPasswordFormSection({
    super.key,
    required this.passwordResetResponseModel,
  });
  final PasswordResetResponseModel passwordResetResponseModel;

  @override
  State<ResetNewPasswordFormSection> createState() =>
      _ResetNewPasswordFormSectionState();
}

class _ResetNewPasswordFormSectionState
    extends State<ResetNewPasswordFormSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String password = '', confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Password',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
            },
            onSaved: (value) {
              password = value!;
            },
          ),
          HeightSpace(height: 28),

          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value != password) {
                return 'Password does not match';
              }
            },
            onSaved: (value) {
              confirmPassword = value!;
            },
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
              formKey.currentState!.save();
              if (formKey.currentState!.validate()) {
                String email =
                    PreferenceManegar().getString(StorageKey.email) ?? '';
                await context.read<ForgotPasswordCubit>().resetPassword(
                  code: widget.passwordResetResponseModel.code,
                  resetToken: widget.passwordResetResponseModel.resetToken,
                  email: email,
                  password: password,
                  confirmPassword: confirmPassword,
                );
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
