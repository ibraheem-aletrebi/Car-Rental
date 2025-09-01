import 'package:car_rental/Feature/auth/presentation/components/custom_logo.dart';
import 'package:car_rental/Feature/home/presentation/components/notification_button.dart';
import 'package:car_rental/Feature/home/presentation/components/user_image.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          CustomLogo(),
          Spacer(),
          NotificationButton(),
          WidthSpace(width: 15),
          UserImage(),
        ],
      ),
    );
  }
}
