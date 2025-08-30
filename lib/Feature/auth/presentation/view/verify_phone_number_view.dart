import 'package:car_rental/Feature/auth/presentation/components/verify_phone_number_view_body.dart';
import 'package:flutter/material.dart';

class VerifyPhoneNumberView extends StatelessWidget {
  const VerifyPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: VerifyPhoneNumberViewBody()));
  }
}
