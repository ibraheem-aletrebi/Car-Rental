import 'package:car_rental/Feature/auth/controllers/sign_up_cubit/signup_cubit.dart';
import 'package:car_rental/core/enums/avialable_add_car.dart';
import 'package:car_rental/core/widgets/custom_text_icon_button.dart';
import 'package:flutter/material.dart';

class AvailableToAddCarWidget extends StatelessWidget {
  const AvailableToAddCarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available to add car",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomTextIconButton(
                text: 'No',
                icon: Icons.close,
                isSelected:
                    SignupCubit.get(context).availableToAddCar ==
                    AvailableToAddCar.no,
                onPressed: () => SignupCubit.get(
                  context,
                ).changeAvailableToAddCar(AvailableToAddCar.no),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomTextIconButton(
                text: 'Yes',
                icon: Icons.check,
                isSelected:
                    SignupCubit.get(context).availableToAddCar ==
                    AvailableToAddCar.yes,
                onPressed: () => SignupCubit.get(
                  context,
                ).changeAvailableToAddCar(AvailableToAddCar.yes),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
