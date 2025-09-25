import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/manager/reset_password/password_reset_controller.dart';
import 'package:car_rental/Feature/auth/presentation/components/reset_password_steps_view_body.dart';
import 'package:car_rental/core/utils/helper/buid_animated_snackbar.dart';
import 'package:car_rental/core/utils/helper/show_flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordStepsViewBodyBlocConsumer extends StatelessWidget {
  const ResetPasswordStepsViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordResetController, PasswordResetState>(
      listener: (context, state) {
        if (state is PasswordResetSuccessState) {
          PasswordResetController.get(context).goToNextPage();
        }
        if (state is PasswordResetCodeSentState) {
          PasswordResetController.get(context).goToNextPage();
          showFlushBar(
            context: context,
            message: 'Code is ${state.response.code}',
            onPressed: () async {
              Clipboard.setData(ClipboardData(text: state.response.code));
            },
            child: const Text('Copy', style: TextStyle(color: Colors.white)),
          );
        }
        if (state is PasswordResetCodeResentState) {
          showFlushBar(
            context: context,
            message: 'New Code is ${state.response.code}',
            onPressed: () async {
              Clipboard.setData(ClipboardData(text: state.response.code));
            },
            child: const Text('Copy', style: TextStyle(color: Colors.white)),
          );
        }
        if (state is PasswordResetVerifiedState) {
          PasswordResetController.get(context).goToNextPage();
        }

        if (state is PasswordResetFailureState) {
          showAnimatedSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return ResetPasswordStepsViewBody();
      },
    );
  }
}
