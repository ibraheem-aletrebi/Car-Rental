import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/presentation/components/email_verification_view_body.dart';
import 'package:car_rental/Feature/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:car_rental/core/utils/helper/buid_animated_snackbar.dart';
import 'package:car_rental/core/utils/helper/show_flushbar.dart';
import 'package:car_rental/core/routing/on_generate_route.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationViewBodyBlocConsumer extends StatelessWidget {
  const EmailVerificationViewBodyBlocConsumer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordCodeSent) {
          showFlushBar(
            context: context,
            message: 'Code is ${state.response.code}',
            onPressed: () async {
              Clipboard.setData(ClipboardData(text: state.response.code));
            },
            child: const Text('Copy', style: TextStyle(color: Colors.white)),
          );
        }
        if (state is ForgotPasswordVerified) {
          Navigator.pushReplacementNamed(
            context,
            Routes.kResetNewPasswordView,
            arguments: ForgotPassordArgs(
              response: ForgotPasswordCubit.get(
                context,
              ).passwordResetResponseModel!,
              email: ForgotPasswordCubit.get(context).email!,
            ),
          );
        }
        if (state is ForgotPasswordError) {
          showAnimatedSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return const EmailVerificationViewBody();
      },
    );
  }
}
