import 'package:car_rental/Feature/auth/domain/repo/password_repo.dart';
import 'package:car_rental/Feature/auth/presentation/components/email_verification_view_body_bloc_consumer.dart';
import 'package:car_rental/Feature/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:car_rental/core/routing/on_generate_route.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key, required this.args});
  final ForgotPassordArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ForgotPasswordCubit(getIt<PasswordRepo>())
            ..updateEmail(args.email)
            ..updatePasswordResponse(response: args.response),
          child: EmailVerificationViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
