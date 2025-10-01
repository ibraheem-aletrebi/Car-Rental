import 'package:car_rental/Feature/auth/presentation/components/custom_logo.dart';
import 'package:car_rental/Feature/auth/controllers/reset_password/password_reset_controller.dart';
import 'package:flutter/material.dart';

class ResetPasswordStepsViewBody extends StatelessWidget {
  const ResetPasswordStepsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CustomLogo(),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: PasswordResetController.get(context).pageController,
              onPageChanged: (value) {},
              itemBuilder: (context, index) {
                return PasswordResetController.get(
                  context,
                ).resetPasswordPages[index];
              },
              itemCount: PasswordResetController.get(
                context,
              ).resetPasswordPages.length,
            ),
          ),
        ],
      ),
    );
  }
}
