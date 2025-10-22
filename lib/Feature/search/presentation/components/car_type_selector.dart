import 'package:car_rental/core/widgets/custom_choice_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarTypeSelector extends StatefulWidget {
  const CarTypeSelector({super.key});

  @override
  State<CarTypeSelector> createState() => _CarTypeSelectorState();
}

class _CarTypeSelectorState extends State<CarTypeSelector> {
  String selectedType = "All Cars";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Text(
          "Type of car",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Container(
          height: 65.h,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          alignment: Alignment.center,
          child: CustomChoiceChips(
            options: ["All Cars", "Regular Cars", "Luxury Cars"],
            selectedValue: selectedType,
            onSelected: (value) {
              setState(() {
                selectedType = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
