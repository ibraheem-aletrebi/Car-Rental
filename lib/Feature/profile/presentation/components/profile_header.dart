import 'package:car_rental/core/cubits/user_cubit/user_cubit.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/widgets/user_avater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = context.read<UserCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        spacing: 16,
        children: [
          UserAvatar(
            radius: 42.r,
            imageUrl: '',
            username: profileController.user?.fullName,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profileController.user?.fullName??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  profileController.user?.email??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13.sp),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.kProfileEditView);
            },
            child: Column(
              children: [
                Icon(Icons.edit_outlined, size: 16.sp, color: Colors.grey[700]),
                SizedBox(width: 4.w),
                Text(
                  "Edit profile",
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
