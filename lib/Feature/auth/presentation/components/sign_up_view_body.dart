import 'package:car_rental/Feature/auth/presentation/components/auth_header_section.dart';
import 'package:car_rental/Feature/auth/presentation/components/redirect_text.dart';
import 'package:car_rental/Feature/auth/presentation/components/sign_up_form_section.dart';
import 'package:car_rental/core/resources/app_strings_keys.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeaderSection(
                  title: context.tr(AppStringsKeys.signUpTitle),
                ),
                HeightSpace(height: 40),
                SignUpFormSection(),
                HeightSpace(height: 25),
                // OrDivider(),
                // HeightSpace(height: 25),
                // SignUpSocialButton(),
                // HeightSpace(height: 10),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RedirectText(
                message: context.tr(AppStringsKeys.alreadyHaveAccount),
                actionText: context.tr(AppStringsKeys.signIn),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
