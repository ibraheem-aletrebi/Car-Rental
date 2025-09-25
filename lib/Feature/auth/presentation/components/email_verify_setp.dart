import 'package:car_rental/Feature/auth/presentation/components/redirect_text.dart';
import 'package:car_rental/Feature/auth/presentation/components/title_subtitle_section.dart';
import 'package:car_rental/Feature/auth/manager/reset_password/password_reset_controller.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/utils/helper/validator.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationStep extends StatelessWidget {
  const EmailVerificationStep({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PasswordResetController.get(context);
    return Form(
      key: controller.emailFormKey,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
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
                      validator: (value) => Validator.email(value),
                      onSaved: (value) => controller.email = value!,
                    ),
                    HeightSpace(height: 28),
                    CustomButton(
                      text: 'Continue',
                      isLoading:
                          context.watch<PasswordResetController>().state
                              is PasswordResetLoadingState,
                      onPressed: () async {
                        controller.emailFormKey.currentState?.save();
                        if (controller.emailFormKey.currentState?.validate() ??
                            false) {
                          await context
                              .read<PasswordResetController>()
                              .sendResetCode(email: controller.email!);
                        } else {
                          controller.updateAutovalidateMode(
                            AutovalidateMode.always,
                          );
                        }
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
