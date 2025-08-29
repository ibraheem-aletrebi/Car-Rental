import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class RemeberMe extends StatefulWidget {
  const RemeberMe({super.key});

  @override
  State<RemeberMe> createState() => _RemeberMeState();
}

class _RemeberMeState extends State<RemeberMe> {
  bool remeberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CustomCheckBox(
          value: remeberMe,
          onChanged: (value) {
            setState(() {
              remeberMe = value!;
            });
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              remeberMe = !remeberMe;
            });
          },
          child: Text('Remember Me', style: AppStyles.regular14),
        ),
      ],
    );
  }
}
