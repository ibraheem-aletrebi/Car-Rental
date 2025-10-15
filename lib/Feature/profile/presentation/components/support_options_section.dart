import 'package:car_rental/core/widgets/custom_divider.dart';
import 'package:car_rental/core/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportOptionsSection extends StatelessWidget {
  const SupportOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Support",
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              CustomListTile(
                icon: Icons.settings_outlined,
                title: "Settings",
                onTap: () {},
              ),
              CustomDivider(),
              CustomListTile(
                icon: Icons.language_outlined,
                title: "Languages",
                onTap: () {},
              ),
              CustomDivider(),

              CustomListTile(
                icon: Icons.person_add_alt_1_outlined,
                title: "Invite Friends",
                onTap: () {},
              ),
              CustomDivider(),

              CustomListTile(
                icon: Icons.privacy_tip_outlined,
                title: "Privacy Policy",
                onTap: () {},
              ),
              CustomDivider(),
              CustomListTile(
                icon: Icons.help_outline,
                title: "Help Support",
                onTap: () {},
              ),
              CustomDivider(),
              CustomListTile(
                icon: Icons.logout,
                title: "Log out",
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
