import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/manager/sign_up_cubit/signup_cubit.dart';
import 'package:car_rental/Feature/auth/presentation/components/sign_up_view_body.dart';
import 'package:car_rental/core/utils/helper/buid_animated_snackbar.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pushReplacementNamed(
            context,
            arguments: state.authResponseModel.userModel.phone,
            Routes.kVerificationCodeView,
          );
        }
        if (state is SignupFailure) {
          showAnimatedSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return SignUpViewBody();
      },
    );
  }
}
