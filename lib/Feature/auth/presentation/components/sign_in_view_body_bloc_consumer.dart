import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/Feature/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:car_rental/Feature/auth/presentation/components/sign_in_view_body.dart';
import 'package:car_rental/core/helper/buid_animated_snackbar.dart';
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
          showAnimatedSnackBar(
            context: context,
            message: 'Hi ${user.fullName.split(' ')[0]}!',
            type: AnimatedSnackBarType.success,
          );
          Navigator.pushReplacementNamed(context, Routes.kMainView);
        }
        if (state is SignInError) {
          showAnimatedSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return SignInViewBody();
      },
    );
  }
}
