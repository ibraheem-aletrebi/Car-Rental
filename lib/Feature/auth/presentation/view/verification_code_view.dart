import 'package:car_rental/Feature/auth/domain/repo/phone_verify_repo.dart';
import 'package:car_rental/Feature/auth/presentation/components/verification_code_view_body_bloc_consumer.dart';
import 'package:car_rental/Feature/auth/presentation/manager/verify_phone_cubit/verify_phone_cubit.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key, required this.phone});
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => VerifyPhoneCubit(getIt<PhoneVerifyRepo>())
            ..updatephone(phone)
            ..sendOtp(phoneNumber: phone),
          child: VerificationCodeViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
