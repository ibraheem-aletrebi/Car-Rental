import 'package:car_rental/core/widgets/custom_choice_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RentalTimeSelector extends StatefulWidget {
  const RentalTimeSelector({super.key});

  @override
  State<RentalTimeSelector> createState() => _RentalTimeSelectorState();
}

class _RentalTimeSelectorState extends State<RentalTimeSelector> {
  String rentalTime = "Hour";

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
        CustomChoiceChips(
          options: ["Hour", "Day", "Weekly", "Monthly"],
          selectedValue: rentalTime,
          onSelected: (value) {
            setState(() => rentalTime = value);
          },
        ),
      ],
    );
  }
}
