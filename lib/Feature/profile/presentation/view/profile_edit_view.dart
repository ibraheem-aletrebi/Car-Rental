import 'package:car_rental/Feature/profile/presentation/components/edit_profile_view_body.dart';
import 'package:car_rental/Feature/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:car_rental/core/widgets/custom_icon_button.dart';
import 'package:car_rental/domain/entities/user_entity.dart';
import 'package:car_rental/domain/repos/user_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key, required this.user});
  final UserProfileEntity user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt<UserRepo>())..user=user,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SafeArea(child: EditProfileViewBody()),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Edit Profile',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leadingWidth: 65.w,
      leading: Center(
        child: CustomIconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icons.arrow_back,
        ),
      ),
      actions: [CustomIconButton(onPressed: () {}, icon: Icons.more_horiz)],
      actionsIconTheme: const IconThemeData(color: Colors.black),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(16.h),
        child: Divider(color: AppColors.kStokeColor, height: 1.h),
      ),
    );
  }
}
