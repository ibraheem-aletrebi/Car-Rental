import 'package:car_rental/Feature/auth/presentation/components/custom_logo.dart';
import 'package:car_rental/Feature/auth/presentation/components/redirect_text.dart';
import 'package:car_rental/Feature/auth/presentation/components/custom_otp_input.dart';
import 'package:car_rental/Feature/auth/presentation/components/title_subtitle_section.dart';
import 'package:car_rental/Feature/auth/presentation/manager/verify_phone_cubit/verify_phone_cubit.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class VerificationCodeViewBody extends StatelessWidget {
  const VerificationCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = VerifyPhoneCubit.get(context);
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
                      title: 'Enter verification code',
                      subTitle: 'We have send a Code to : +${controller.phone}',
                    ),
                    HeightSpace(height: 40),
                    Form(
                      key: controller.formKey,
                      child: CustomOtpInput(
                        onSubmitted: (value) {
                          if (controller.formKey.currentState?.validate() ??
                              false) {
                            controller.verifyOtp(
                              verifyToken: controller
                                  .verifyPhoneResponseModel!
                                  .verifyToken,
                              otp: value,
                            );
                          }
                        },
                        onCompleted: (value) {
                          controller.otpCode = value;
                        },
                      ),
                    ),
                    HeightSpace(height: 28),
                    CustomButton(
                      isLoading: controller.state is VerifyPhoneLoading,
                      text: 'Continue',
                      onPressed: () {
                        if (controller.formKey.currentState?.validate()??false) {
                          controller.verifyOtp(
                            verifyToken: controller
                                .verifyPhoneResponseModel!
                                .verifyToken,
                            otp: controller.otpCode,
                          );
                        }
                      },
                    ),
                    HeightSpace(),
                    CustomButton(
                      backgroundColor: AppColors.kDarkWhite,
                      textColor: AppColors.kPrimaryColor,
                      borderColor: AppColors.kStokeColor,
                      text: 'Skip for now',
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.kSignInView);
                      },
                    ),
                    HeightSpace(height: 28),
                    RedirectText(
                      message: 'Didn’t receive the OTP? ',
                      actionText: 'Resend.',
                      onTap: () {
                        controller.resendOtp(phoneNumber: controller.phone!);
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
