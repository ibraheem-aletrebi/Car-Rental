import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/presentation/components/forget_password_view_body.dart';
import 'package:car_rental/Feature/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgetPasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordCodeSent) {
          AnimatedSnackBar.material(
            'Code sent! check your email',
            type: AnimatedSnackBarType.success,
            mobilePositionSettings: const MobilePositionSettings(
              topOnAppearance: 100,
            ),
          ).show(context);
          Navigator.pushNamed(
            context,
            Routes.kEmailVerificationView,
            arguments: state.response,
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
        return ForgetPasswordViewBody();
      },
    );
  }
}
