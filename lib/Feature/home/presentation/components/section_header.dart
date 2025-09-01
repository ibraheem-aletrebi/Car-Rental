import 'package:car_rental/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onActionPressed;

  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onActionPressed,
      child: Row(
        children: [
          Text(title, style: AppStyles.semiBold16),
          const Spacer(),
          Text(actionText, style: AppStyles.regular12),
          const SizedBox(
            width: 4,
          ), 
        ],
      ),
    );
  }
}
