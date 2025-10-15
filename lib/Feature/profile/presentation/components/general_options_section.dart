import 'package:car_rental/core/widgets/custom_divider.dart';
import 'package:car_rental/core/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralOptionsSection extends StatelessWidget {
  const GeneralOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "General",
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
                icon: Icons.favorite_border,
                title: "Favorite Cars",
                onTap: () {},
              ),
              CustomDivider(),
              CustomListTile(
                icon: Icons.history,
                title: "Previous Rant",
                onTap: () {},
              ),
                CustomDivider(),
              CustomListTile(
                icon: Icons.notifications_none,
                title: "Notification",
                onTap: () {},
              ),
                CustomDivider(),
              CustomListTile(
                icon: Icons.link_outlined,
                title: "Connected to QENT Partnerships",
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}