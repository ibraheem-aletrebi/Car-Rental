import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/Feature/auth/presentation/components/verify_phone_number_view_body.dart';
import 'package:car_rental/Feature/auth/presentation/manager/verify_phone_cubit/verify_phone_cubit.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPhoneViewBodyBlocConsumer extends StatelessWidget {
  const VerifyPhoneViewBodyBlocConsumer({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyPhoneCubit, VerifyPhoneState>(
      listener: (context, state) {
        if (state is VerifyPhoneCodeResent) {
          AnimatedSnackBar.material(
            'Code resent',
            type: AnimatedSnackBarType.success,
            mobilePositionSettings: const MobilePositionSettings(
              topOnAppearance: 100,
            ),
          ).show(context);
        }

        if (state is VerifyPhoneCodeSent) {
          AnimatedSnackBar.material(
            'Code sent',
            type: AnimatedSnackBarType.success,
            mobilePositionSettings: const MobilePositionSettings(
              topOnAppearance: 100,
            ),
          ).show(context);
          Navigator.pushNamed(
            context,
            arguments: state.verifyPhoneResponseModel,
            Routes.kVerificationCodeView,
          );
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
        return VerifyPhoneNumberViewBody(userModel: userModel);
      },
    );
  }
}
