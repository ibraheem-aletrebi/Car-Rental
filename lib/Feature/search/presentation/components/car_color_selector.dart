import 'package:car_rental/core/widgets/custom_color_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarColorSelector extends StatefulWidget {
  const CarColorSelector({super.key});

  @override
  State<CarColorSelector> createState() => _CarColorSelectorState();
}

class _CarColorSelectorState extends State<CarColorSelector> {
  String selectedColorName = 'Black';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        const Text(
          'Select Color',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        ColorSelector(
          colors: {
            "Black": Colors.black,
            "White": Colors.white,
            "Red": Colors.red,
            "Blue": Colors.blue,
            "Green": Colors.green,
            "Grey": Colors.grey,
          },
          selectedColorName: selectedColorName,
          onSelected: (name) => setState(() => selectedColorName = name),
        ),
      ],
    );
  }
}
