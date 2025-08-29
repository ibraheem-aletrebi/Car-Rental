import 'dart:io';

import 'package:car_rental/Feature/auth/presentation/components/social_button.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class SignUpSocialButton extends StatelessWidget {
  const SignUpSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: Platform.isIOS,
          child: Column(
            children: [
              HeightSpace(height: 18),
              SocialButton(
                socialIconPath: Assets.iconsAppleIcon,
                socialName: 'Apple',
                onPressed: () {},
              ),
            ],
          ),
        ),
        SocialButton(
          socialIconPath: Assets.iconsGoogleIcon,
          socialName: 'Google',
          onPressed: () {},
        ),
      ],
    );
  }
}
