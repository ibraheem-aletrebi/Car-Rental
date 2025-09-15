import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/Feature/auth/presentation/components/country_info_row.dart';
import 'package:car_rental/Feature/auth/presentation/components/custom_logo.dart';
import 'package:car_rental/Feature/auth/presentation/components/title_subtitle_section.dart';
import 'package:car_rental/Feature/auth/presentation/manager/verify_phone_cubit/verify_phone_cubit.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPhoneNumberViewBody extends StatelessWidget {
  const VerifyPhoneNumberViewBody({super.key, required this.userModel});
  final UserModel userModel;
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TitleSubtitleSection(
                      title: 'Verify your phone number',
                      subTitle: 'We have sent you an SMS with a code to number',
                    ),
                    HeightSpace(height: 40),
                    CountryInfoRow(countryModel: userModel.country),

                    HeightSpace(),
                    CustomTextFormField(
                      initialValue: userModel.phone,
                      enabled: false,
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                    ),
                    HeightSpace(height: 28),
                    CustomButton(
                      isLoading:
                          context.watch<VerifyPhoneCubit>().state
                              is VerifyPhoneLoading,
                      text: 'Send Code',
                      onPressed: () {
                        context.read<VerifyPhoneCubit>().verifyPhoneNumber(
                          phoneNumber: userModel.phone!,
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
