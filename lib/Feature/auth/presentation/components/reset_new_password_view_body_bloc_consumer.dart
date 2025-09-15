import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/data/model/password_reset_response_model.dart';
import 'package:car_rental/Feature/auth/presentation/components/reset_new_password_view_body.dart';
import 'package:car_rental/Feature/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetNewPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ResetNewPasswordViewBodyBlocConsumer({
    super.key,
    required this.passwordResetResponseModel,
  });
  final PasswordResetResponseModel passwordResetResponseModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordError) {
          AnimatedSnackBar.material(
            state.message,
            type: AnimatedSnackBarType.error,
            mobilePositionSettings: const MobilePositionSettings(
              topOnAppearance: 100,
            ),
          ).show(context);
        }
        if (state is ForgotPasswordSuccess) {
          Navigator.pushNamed(context, Routes.kResetPasswordSuccessView);
        }
      },
      builder: (context, state) {
        return ResetNewPasswordViewBody(
          passwordResetResponseModel: passwordResetResponseModel,
        );
      },
    );
  }
}
