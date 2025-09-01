import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconTextRow extends StatelessWidget {
  final String iconPath;
  final String text;
  final TextStyle textStyle;
  final double? spacing;

  const IconTextRow({
    super.key,
    required this.iconPath,
    required this.text,
    required this.textStyle,
    this.spacing = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Take only required space
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(iconPath),
        SizedBox(width: spacing ?? 5),

        Text(
          text,
          style: textStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
