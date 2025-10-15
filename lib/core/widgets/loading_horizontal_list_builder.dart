import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingHorizontalListBuilder extends StatelessWidget {
  const LoadingHorizontalListBuilder({
    super.key,
    required this.itemBuilder,
    this.height = 100,
    this.itemCount = 10,
  });
  final double height;
  final int itemCount;
  final Widget itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 8.w,
          children: List.generate(itemCount, (index) => itemBuilder),
        ),
      ),
    );
  }
}
