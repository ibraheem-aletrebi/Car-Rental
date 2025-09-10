import 'package:car_rental/Feature/auth/domain/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/Feature/auth/presentation/components/sign_in_view_body_bloc_consumer.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignInCubit(authRepo: getIt<AuthRepo>()),
          child: SignInViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
