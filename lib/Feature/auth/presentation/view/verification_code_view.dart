import 'package:car_rental/Feature/auth/presentation/components/verification_code_view_body.dart';
import 'package:flutter/material.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: VerificationCodeViewBody()),
    );
  }
}