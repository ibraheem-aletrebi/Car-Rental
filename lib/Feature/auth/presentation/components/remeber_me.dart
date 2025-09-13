import 'package:car_rental/Feature/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:car_rental/core/services/local_services/secure_storage_services.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemeberMe extends StatefulWidget {
  const RemeberMe({super.key});

  @override
  State<RemeberMe> createState() => _RemeberMeState();
}

class _RemeberMeState extends State<RemeberMe> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CustomCheckBox(
          value: rememberMe,
          onChanged: (value) {
            setState(() {
              rememberMe = value!;
            });
          },
        ),
        GestureDetector(
          onTap: () {
            _toggleRememberMe();
          },
          child: Text('Remember Me', style: AppStyles.regular14),
        ),
      ],
    );
  }

  void _toggleRememberMe() async {
    setState(() {
      rememberMe = !rememberMe;
    });

    final state = context.read<SignInCubit>().state;
    String? token;

    if (state is SignInSuccess) {
      token = state.tokenModel.token;
    }

    if (rememberMe) {
      if (token != null) {
        await getIt<SecureStorageService>().saveAccessToken(token);
      }
    } else {
      await getIt<SecureStorageService>().deleteAccessToken();
    }
  }
}
