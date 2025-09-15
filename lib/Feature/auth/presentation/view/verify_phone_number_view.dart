import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/Feature/auth/presentation/components/verify_phone_view_body_bloc_consumer.dart';
import 'package:car_rental/Feature/auth/presentation/manager/verify_phone_cubit/verify_phone_cubit.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPhoneNumberView extends StatelessWidget {
  const VerifyPhoneNumberView({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => VerifyPhoneCubit(getIt<AuthRepo>()),
          child: VerifyPhoneViewBodyBlocConsumer(userModel: userModel),
        ),
      ),
    );
  }
}
