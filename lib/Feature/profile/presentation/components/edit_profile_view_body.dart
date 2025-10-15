import 'package:car_rental/core/cubits/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rental/core/widgets/custom_button.dart';

import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/user_avater.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = context.read<UserCubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Center(
        child: Column(
          children: [
            HeightSpace(height: 30),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                UserAvatar(
                  radius: 60.r,
                  imageUrl: '',
                  username: profileController.user?.fullName,
                ),
                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(Icons.edit, size: 18.sp, color: Colors.grey[700]),
                ),
              ],
            ),
            HeightSpace(height: 8),
            Text(
              profileController.user?.fullName ?? ' ',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            HeightSpace(height: 30),
            CustomTextFormField(
              hintText: 'Full Name',
              initialValue: profileController.user!.fullName,
            ),

            HeightSpace(height: 16),
            CustomTextFormField(
              hintText: 'Email',
              initialValue: profileController.user!.email,
            ),
            HeightSpace(height: 16),
            CustomTextFormField(
              hintText: 'Phone',
              initialValue: profileController.user!.phone,
            ),
            HeightSpace(height: 25),
            CustomButton(text: 'Save Changes', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
