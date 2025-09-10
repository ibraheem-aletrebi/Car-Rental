import 'package:car_rental/Feature/auth/presentation/components/paginated_country_dropdown.dart';
import 'package:car_rental/Feature/auth/presentation/components/custom_logo.dart';
import 'package:car_rental/Feature/auth/presentation/components/title_subtitle_section.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class VerifyPhoneNumberViewBody extends StatelessWidget {
  const VerifyPhoneNumberViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          CustomLogo(),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                // physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TitleSubtitleSection(
                      title: 'Verify your phone number',
                      subTitle: 'We have sent you an SMS with a code to number',
                    ),
                    HeightSpace(height: 40),
                    PaginatedCountryDropdown(onChanged: (value) {}),
                    HeightSpace(),
                    CustomTextFormField(
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                    ),
                    HeightSpace(height: 28),
                    CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.kVerificationCodeView,
                        );
                      },
                    ),
                    HeightSpace(height: 28),
                    CustomButton(
                      borderColor: AppColors.kStokeColor,
                      textColor: AppColors.kPrimaryColor,
                      backgroundColor: AppColors.kDarkWhite,
                      text: 'Skip for now',
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.kMainView,
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
