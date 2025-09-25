import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/presentation/components/reset_new_password_view_body.dart';
import 'package:car_rental/Feature/auth/controllers/reset_password/password_reset_controller.dart';
import 'package:car_rental/core/utils/helper/buid_animated_snackbar.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetNewPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ResetNewPasswordViewBodyBlocConsumer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordResetController, PasswordResetState>(
      listener: (context, state) {
        if (state is PasswordResetFailureState) {
          showAnimatedSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
        if (state is PasswordResetSuccessState) {
          Navigator.pushNamed(context, Routes.kResetPasswordSuccessView);
        }
      },
      builder: (context, state) {
        return ResetNewPasswordViewBody();
      },
    );
  }
}
