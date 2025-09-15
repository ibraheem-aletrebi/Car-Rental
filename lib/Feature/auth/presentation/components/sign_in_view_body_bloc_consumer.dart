import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/Feature/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:car_rental/Feature/auth/presentation/components/sign_in_view_body.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          final UserModel user = state.authResponseModel.userModel;
          AnimatedSnackBar.material(
            'Hi ${user.fullName.split(' ')[0]}! Welcome',
            type: AnimatedSnackBarType.success,
            mobilePositionSettings: const MobilePositionSettings(
              topOnAppearance: 100,
            ),
          ).show(context);
          user.phoneIsVerified
              ? Navigator.pushReplacementNamed(context, Routes.kMainView)
              : Navigator.pushReplacementNamed(
                  context,
                  Routes.kVerifyPhoneNumberView,
                  arguments: user,
                );
        }
        if (state is SignInError) {
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
        return SignInViewBody();
      },
    );
  }
}
