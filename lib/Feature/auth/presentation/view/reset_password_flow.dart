import 'package:car_rental/Feature/auth/domain/repo/password_repo.dart';
import 'package:car_rental/Feature/auth/manager/reset_password/password_reset_controller.dart';
import 'package:car_rental/Feature/auth/presentation/components/reset_password_steps_view_body_bloc_consumer.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordSteps extends StatelessWidget {
  const ResetPasswordSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PasswordResetController(passwordRepo: getIt<PasswordRepo>()),
      child: Scaffold(
        body: SafeArea(child: ResetPasswordStepsViewBodyBlocConsumer()),
      ),
    );
  }
}
