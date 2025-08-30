import 'package:car_rental/Feature/auth/presentation/components/country_drop_down_button.dart';
import 'package:car_rental/Feature/auth/presentation/components/title_subtitle_section.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerifyPhoneNumberViewBody extends StatelessWidget {
  const VerifyPhoneNumberViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(Assets.imagesLightLogo, width: 105),
          ),
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
                    CountryDropDownButton(),
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
