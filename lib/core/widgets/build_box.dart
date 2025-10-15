import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildBox({
  double? height,
  double? width,
  BorderRadius? borderRadius,
  BoxShape shape = BoxShape.rectangle,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: Colors.grey,
      shape: shape,
      borderRadius: shape == BoxShape.rectangle
          ? borderRadius ?? BorderRadius.circular(6.r)
          : null,
    ),
  );
}
