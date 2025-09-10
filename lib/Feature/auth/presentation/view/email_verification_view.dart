import 'package:car_rental/Feature/auth/presentation/components/email_verification_view_body.dart';
import 'package:flutter/material.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: EmailVerificationViewBody()));
  }
}
