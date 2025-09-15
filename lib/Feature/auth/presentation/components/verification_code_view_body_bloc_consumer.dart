import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/presentation/components/verification_code_view_body.dart';
import 'package:car_rental/Feature/auth/presentation/manager/verify_phone_cubit/verify_phone_cubit.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeViewBodyBlocConsumer extends StatelessWidget {
  const VerificationCodeViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyPhoneCubit, VerifyPhoneState>(
      listener: (context, state) {
        if (state is VerifyPhoneVerified) {
          AnimatedSnackBar.material(
            'Phone number verified',
            type: AnimatedSnackBarType.success,
            mobilePositionSettings: const MobilePositionSettings(
              topOnAppearance: 100,
            ),
          ).show(context);
          Navigator.pushReplacementNamed(context, Routes.kMainView);
        }
        if (state is VerifyPhoneError) {
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
        return const VerificationCodeViewBody();
      },
    );
  }
}
