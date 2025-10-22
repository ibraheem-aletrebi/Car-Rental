// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "OnBoarding": {
    "onBoardingTitle1": "Find Your Perfect Ride",
    "onBoardingDesc1": "Discover a wide range of cars that fit your style, budget, and journey — all available in just a few taps.",
    "onBoardingTitle2": "Book Easily, Drive Freely",
    "onBoardingDesc2": "Choose your car, set your rental time, and hit the road with instant booking and flexible options."
  },
  "Next": "Next",
  "Get Started": "Get Started",
  "Skip": "Skip",
  "email": "Email",
  "password": "Password",
  "fullName": "Full Name",
  "phoneNumber": "Phone Number",
  "country": "Country",
  "location": "Location",
  "availableToAddCar": "Available To Add Car",
  "yes": "Yes",
  "no": "No",
  "hi": "Hi",
  "Authentication": {
    "signIn": "SignIn",
    "signInTitle": "Welcome Back Ready to hit the road.",
    "rememberMe": "Remember Me",
    "forgetPassword": "Forget Password?",
    "dontHaveAccount": "Don't have an account?",
    "signUp": "SignUp",
    "signUpTitle": "Create Your Account",
    "alreadyHaveAccount": "Already Have an Account?"
  }
};
static const Map<String,dynamic> _ar = {};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "ar": _ar};
}
