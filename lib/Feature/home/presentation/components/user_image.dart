import 'package:car_rental/core/styles/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22.r,
      backgroundImage: AssetImage(Assets.imagesUser),
    );
  }
}
