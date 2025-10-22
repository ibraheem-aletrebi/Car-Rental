import 'package:car_rental/core/widgets/custom_choice_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SittingCapacitySelector extends StatefulWidget {
  const SittingCapacitySelector({super.key});

  @override
  State<SittingCapacitySelector> createState() =>
      _SittingCapacitySelectorState();
}

class _SittingCapacitySelectorState extends State<SittingCapacitySelector> {
  int sittingCapacity = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Text(
          'Rental Time',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        CustomChoiceChips<int>(
          options: [2, 4, 8, 14],
          selectedValue: sittingCapacity,
          onSelected: (value) {
            setState(() => sittingCapacity = value);
          },
        ),
      ],
    );
  }
}
