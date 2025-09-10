import 'package:car_rental/Feature/auth/presentation/components/reset_new_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetNewPasswordView extends StatelessWidget {
  const ResetNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ResetNewPasswordViewBody()),
    );
  }
}