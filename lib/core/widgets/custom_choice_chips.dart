import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChoiceChips<T> extends StatelessWidget {
  final List<T> options;
  final T selectedValue;
  final ValueChanged<T> onSelected;
  final double spacing;
  final double runSpacing;

  const CustomChoiceChips({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
    this.spacing = 10,
    this.runSpacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: options.map((e) {
        final bool isSelected = selectedValue == e;
        return ChoiceChip(
          label: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            child: Text(
              e.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black87,
                fontSize: 13.sp,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          selected: isSelected,
          onSelected: (_) => onSelected(e),
          backgroundColor: Colors.transparent,
          selectedColor: Colors.black,
          side: BorderSide(
            color: isSelected ? Colors.black : Colors.grey.shade300,
          ),
          elevation: 0,
          pressElevation: 0,
          visualDensity: VisualDensity.compact,
        );
      }).toList(),
    );
  }
}
