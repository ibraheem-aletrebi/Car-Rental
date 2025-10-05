import 'package:car_rental/Feature/auth/controllers/sign_in_cubit/sign_in_cubit.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemeberMe extends StatelessWidget {
  const RemeberMe({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<SignInCubit>();
    return Row(
      spacing: 10,
      children: [
        CustomCheckBox(
          value: controller.rememberMe,
          onChanged: (value) {
            controller.toggleRememberMe(value!);
          },
        ),
        GestureDetector(
          onTap: () {
            controller.toggleRememberMe(!controller.rememberMe);
          },
          child: Text('Remember Me', style: AppStyles.regular14),
        ),
      ],
    );
  }
}
