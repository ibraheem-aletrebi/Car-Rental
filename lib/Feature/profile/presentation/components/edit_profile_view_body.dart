import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:car_rental/Feature/profile/presentation/components/update_profile_form.dart';
import 'package:car_rental/Feature/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:car_rental/core/cubits/user_cubit/user_cubit.dart';
import 'package:car_rental/core/utils/helper/buid_animated_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/height_space.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is ProfileUpdateSuccess) {
          showAnimatedSnackBar(
            context: context,
            message: 'Profile updated successfully',
            type: AnimatedSnackBarType.success,
          );
          context.read<UserCubit>().fetchUserProfile();
        }
        if (state is ProfileUpdateFailure) {
          showAnimatedSnackBar(
            context: context,
            message: state.errorMessage,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Column(
              children: [
                HeightSpace(height: 30),
                UpdateProfileForm(),
                HeightSpace(height: 25),
                CustomButton(
                  isLoading: state is ProfileUpdateLoading,
                  text: 'Save Changes',
                  onPressed: state is ProfileUpdateLoading
                      ? null
                      : () {
                          var controller = context.read<ProfileCubit>();
                          controller.profileFormKey.currentState!.save();
                          if (controller.profileFormKey.currentState!
                              .validate()) {
                            controller.updateUserProfile();
                          }
                        },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
