import 'package:car_rental/Feature/home/presentation/components/loading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestCarItemLoading extends StatelessWidget {
  const BestCarItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 186.w / 237.h,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container(color: Colors.grey.shade300)),
            Expanded(
              child: Column(
                children: List.generate(4, (index) => const LoadingText()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
