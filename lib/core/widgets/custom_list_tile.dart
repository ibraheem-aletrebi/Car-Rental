import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.icon, required this.title, required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
      return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
    leading: CircleAvatar(
      radius: 20.r,
      backgroundColor: Colors.grey[100],
      child: Icon(icon, color: Colors.black54, size: 20.sp),
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
    ),
    trailing: Icon(Icons.chevron_right, color: Colors.grey[500]),
    onTap: onTap,
  );
  }
}