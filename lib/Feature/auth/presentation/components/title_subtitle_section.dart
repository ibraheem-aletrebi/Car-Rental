import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class TitleSubtitleSection extends StatelessWidget {
  const TitleSubtitleSection({
    super.key,
    required this.title,
    required this.subTitle,
    this.textAlign,
  });
  final String title, subTitle;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyles.semiBold30,
          textAlign: textAlign ?? TextAlign.center,
        ),
        HeightSpace(),
        Text(
          subTitle,
          textAlign: textAlign ?? TextAlign.center,
          style: AppStyles.regular14,
        ),
      ],
    );
  }
}
