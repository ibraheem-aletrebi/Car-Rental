import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorSelector extends StatelessWidget {
  final Map<String, Color> colors;
  final String selectedColorName;
  final ValueChanged<String> onSelected;
  final double circleSize;
  final double spacing;

  const ColorSelector({
    super.key,
    required this.colors,
    required this.selectedColorName,
    required this.onSelected,
    this.circleSize = 26,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: spacing.w,
        children: colors.entries.map((entry) {
          final name = entry.key;
          final color = entry.value;
          final bool isSelected = selectedColorName == name;
          return GestureDetector(
            onTap: () => onSelected(name),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: circleSize.w,
                  height: circleSize.w,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: isSelected ? 3 : 0,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.black : Colors.black87,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
