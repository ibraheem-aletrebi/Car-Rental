import 'package:car_rental/Feature/auth/domain/repo/phone_verify_repo.dart';
import 'package:car_rental/Feature/auth/domain/repo/sign_up_repo.dart';

import 'package:car_rental/Feature/auth/presentation/components/sign_up_view_body_bloc_consumer.dart';
import 'package:car_rental/Feature/auth/controllers/sign_up_cubit/signup_cubit.dart';
import 'package:car_rental/Feature/auth/controllers/verify_phone_cubit/verify_phone_cubit.dart';
import 'package:car_rental/core/services/local_services/secure_storage_services.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<SignupCubit>(
              create: (context) => SignupCubit(
                signUpRepo: getIt<SignUpRepo>(),
                secureStorageService: getIt<SecureStorageService>(),
              ),
            ),
            BlocProvider(
              create: (context) => VerifyPhoneCubit(getIt<PhoneVerifyRepo>()),
            ),
          ],

          child: SignUpViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
