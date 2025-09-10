import 'package:car_rental/Feature/auth/domain/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/Feature/auth/presentation/components/sign_up_view_body_bloc_consumer.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignUpCubit(getIt<AuthRepo>()),
          child: SignUpViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
