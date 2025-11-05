import 'package:car_rental/core/resources/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomCircleLoading extends StatelessWidget {
  const CustomCircleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      child: LottieBuilder.asset(Assets.lottieCircleLoading),
    );
  }
}
