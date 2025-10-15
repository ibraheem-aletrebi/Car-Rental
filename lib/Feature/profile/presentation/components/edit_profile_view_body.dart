import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rental/core/widgets/custom_button.dart';

import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/user_avater.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                  imageUrl:
                      'https://tabler.io/_next/image?url=%2Favatars%2Fdefault%2F2244af71ad0c25f2cb0a8efa167491fb.png&w=280&q=85',
                  username: 'ibraheem',
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
              'Ibraheem al-etrebi',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            HeightSpace(height: 30),
            CustomTextFormField(
              hintText: 'Full Name',
              initialValue: 'ibraheem al-etrebi',
            ),

            HeightSpace(height: 16),
            CustomTextFormField(
              hintText: 'Email',
              initialValue: 'ibraheem.al-etrebi',
            ),
            HeightSpace(height: 16),
            CustomTextFormField(
              hintText: 'Phone',
              initialValue: '+962 7 1234 5678',
            ),
            HeightSpace(height: 25),
            CustomButton(text: 'Save Changes', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
