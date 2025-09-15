import 'package:car_rental/Feature/auth/presentation/components/custom_otp_input.dart';
import 'package:car_rental/Feature/auth/presentation/components/redirect_text.dart';
import 'package:car_rental/Feature/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationFormSection extends StatefulWidget {
  const EmailVerificationFormSection({super.key});

  @override
  State<EmailVerificationFormSection> createState() =>
      _EmailVerificationFormSectionState();
}

class _EmailVerificationFormSectionState
    extends State<EmailVerificationFormSection> {
  String? code;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOtpInput(
          onCompleted: (value) {
            setState(() {
              code = value;
            });
          },
        ),
        HeightSpace(height: 40),
        CustomButton(
          text: 'Continue',
          isLoading:
              context.watch<ForgotPasswordCubit>().state
                  is ForgotPasswordLoading,
          onPressed: () {
            context.read<ForgotPasswordCubit>().verifyCode(code: code!);
          },
        ),
        HeightSpace(height: 30),
        RedirectText(
          message: 'Didn’t receive the OTP?',
          actionText: 'Resend.',
          onTap: () {},
        ),
      ],
    );
  }
}
