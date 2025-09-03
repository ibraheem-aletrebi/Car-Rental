import 'package:car_rental/Feature/auth/presentation/components/social_button.dart';

import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpSocialButton extends StatelessWidget {
  const SignUpSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialButton(
          icon: FontAwesomeIcons.facebook,
          socialName: 'Facebook',
          onPressed: () {},
        ),
        HeightSpace(height: 18),
        SocialButton(
          icon: FontAwesomeIcons.google,
          socialName: 'Google',
          onPressed: () {},
        ),
      ],
    );
  }
}
