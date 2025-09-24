import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/presentation/components/verification_code_view_body.dart';
import 'package:car_rental/Feature/auth/presentation/manager/verify_phone_cubit/verify_phone_cubit.dart';
import 'package:car_rental/core/helper/buid_animated_snackbar.dart';
import 'package:car_rental/core/helper/show_flushbar.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeViewBodyBlocConsumer extends StatelessWidget {
  const VerificationCodeViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyPhoneCubit, VerifyPhoneState>(
      listener: (context, state) {
        if (state is VerifyPhoneCodeSent) {
          showFlushBar(
            context: context,
            message: 'Code is +${state.verifyPhoneResponseModel.code}',
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(text: state.verifyPhoneResponseModel.code),
              );
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
            child: const Text('Copy', style: TextStyle(color: Colors.white)),
          );
        }
        if (state is VerifyPhoneVerified) {
          showAnimatedSnackBar(
            context: context,
            message: 'Phone number verified',
            type: AnimatedSnackBarType.success,
          );
          Navigator.pushReplacementNamed(context, Routes.kMainView);
        }
        if (state is VerifyPhoneError) {
          showAnimatedSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return const VerificationCodeViewBody();
      },
    );
  }
}
