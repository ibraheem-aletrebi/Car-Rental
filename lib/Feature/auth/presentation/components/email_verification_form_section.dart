import 'package:car_rental/Feature/auth/presentation/components/custom_otp_input.dart';
import 'package:car_rental/Feature/auth/presentation/components/redirect_text.dart';
import 'package:car_rental/Feature/auth/manager/reset_password/password_reset_controller.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationFormSection extends StatelessWidget {
  const EmailVerificationFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PasswordResetController.get(context);
    return Column(
      children: [
        Form(
          key: controller.codeFormKey,
          child: CustomOtpInput(
            onSubmitted: (value) {
              if (controller.codeFormKey.currentState?.validate() ?? false) {
                context.read<PasswordResetController>().verifyCode(
                  // code: controller.code!,
                );
              }
            },
            onCompleted: (value) {
              controller.code = value;
            },
          ),
        ),
        HeightSpace(height: 40),
        CustomButton(
          text: 'Continue',
          isLoading:
              context.watch<PasswordResetController>().state
                  is PasswordResetLoadingState,
          onPressed: () {
            if (controller.codeFormKey.currentState?.validate() ?? false) {
              context.read<PasswordResetController>().verifyCode();
            }
          },
        ),
        HeightSpace(height: 30),
        RedirectText(
          message: 'Didn’t receive the OTP?',
          actionText: 'Resend.',
          onTap: () {
            context.read<PasswordResetController>().resendCode();
          },
        ),
      ],
    );
  }
}
