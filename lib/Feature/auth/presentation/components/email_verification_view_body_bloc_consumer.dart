import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/data/model/password_reset_response_model.dart';
import 'package:car_rental/Feature/auth/presentation/components/email_verification_view_body.dart';
import 'package:car_rental/Feature/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationViewBodyBlocConsumer extends StatelessWidget {
  const EmailVerificationViewBodyBlocConsumer({
    super.key,
    required this.response,
  });
  final PasswordResetResponseModel response;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordVerified) {
          AnimatedSnackBar.material(
            'Email verified',
            type: AnimatedSnackBarType.success,
            mobilePositionSettings: const MobilePositionSettings(
              topOnAppearance: 100,
            ),
          );
          Navigator.pushReplacementNamed(
            context,
            Routes.kResetNewPasswordView,
            arguments: response,
          );
        }
        if (state is ForgotPasswordError) {
          AnimatedSnackBar.material(
            state.message,
            type: AnimatedSnackBarType.error,
            mobilePositionSettings: const MobilePositionSettings(
              topOnAppearance: 100,
            ),
          ).show(context);
        }
      },
      builder: (context, state) {
        return const EmailVerificationViewBody();
      },
    );
  }
}
