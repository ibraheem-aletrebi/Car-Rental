import 'package:car_rental/core/widgets/custom_choice_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FuelTypeSelector extends StatefulWidget {
  const FuelTypeSelector({super.key});

  @override
  State<FuelTypeSelector> createState() => _FuelTypeSelectorState();
}

class _FuelTypeSelectorState extends State<FuelTypeSelector> {
  String fuelType = "Electric";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Text(
          "Fuel Type",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        CustomChoiceChips(
          options: ["Electric", "Petrol", "Diesel", "Hybrid"],
          selectedValue: fuelType,
          onSelected: (value) {
            setState(() {
              fuelType = value;
            });
          },
        ),
      ],
    );
  }
}
