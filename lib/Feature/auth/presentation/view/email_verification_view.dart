import 'package:car_rental/Feature/auth/data/model/password_reset_response_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/Feature/auth/presentation/components/email_verification_view_body_bloc_consumer.dart';
import 'package:car_rental/Feature/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({
    super.key,
    required this.passwordResetResponseModel,
  });
  final PasswordResetResponseModel passwordResetResponseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ForgotPasswordCubit(getIt<AuthRepo>()),
          child: EmailVerificationViewBodyBlocConsumer(
            response: passwordResetResponseModel,
          ),
        ),
      ),
    );
  }
}
