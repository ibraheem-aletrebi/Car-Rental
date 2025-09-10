import 'package:car_rental/Feature/auth/presentation/components/reset_password_success_view_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordSuccessView extends StatelessWidget {
  const ResetPasswordSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: ResetPasswordSuccessViewBody()));
  }
}
