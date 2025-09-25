import 'package:car_rental/Feature/auth/presentation/components/custom_otp_input.dart';
import 'package:car_rental/Feature/auth/presentation/components/redirect_text.dart';
import 'package:car_rental/Feature/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationFormSection extends StatelessWidget {
  const EmailVerificationFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = ForgotPasswordCubit.get(context);
    return Column(
      children: [
        Form(
          key: controller.formKey,
          child: CustomOtpInput(
            onSubmitted: (value){
               if (controller.formKey.currentState?.validate() ?? false) {
              context.read<ForgotPasswordCubit>().verifyCode(
                code: controller.code!,
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
              context.watch<ForgotPasswordCubit>().state
                  is ForgotPasswordLoading,
          onPressed: () {
            if (controller.formKey.currentState?.validate() ?? false) {
              context.read<ForgotPasswordCubit>().verifyCode(
                code: controller.code!,
              );
            }
          },
        ),
        HeightSpace(height: 30),
        RedirectText(
          message: 'Didn’t receive the OTP?',
          actionText: 'Resend.',
          onTap: () {
            context.read<ForgotPasswordCubit>().resendCode();
          },
        ),
      ],
    );
  }
}
