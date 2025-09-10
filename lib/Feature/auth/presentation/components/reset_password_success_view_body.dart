import 'package:car_rental/Feature/auth/presentation/components/title_subtitle_section.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class ResetPasswordSuccessViewBody extends StatelessWidget {
  const ResetPasswordSuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesSuccessResetPassword,
            height: MediaQuery.sizeOf(context).height / 2,
          ),
          HeightSpace(height: 50),
          TitleSubtitleSection(
            title: 'New password set successfully',
            subTitle:
                'Congratulations! Your password has been set successfully. Please proceed to the login screen to verify your account.',
          ),
          Spacer(),
          CustomButton(
            text: 'Sign In',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.kSignInView,
                (route) => false,
              );
            },
          ),
          HeightSpace(height: 50),
        ],
      ),
    );
  }
}
