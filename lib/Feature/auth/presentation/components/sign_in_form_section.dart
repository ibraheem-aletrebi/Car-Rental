import 'dart:developer';

import 'package:car_rental/Feature/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:car_rental/Feature/auth/presentation/components/remeber_forget_password_section.dart';

import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInFormSection extends StatefulWidget {
  const SignInFormSection({super.key});

  @override
  State<SignInFormSection> createState() => _SignInFormSectionState();
}

class _SignInFormSectionState extends State<SignInFormSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String email = '', password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (value) {
              setState(() {
                email = value!;
              });
            },
            hintText: 'Email',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
          HeightSpace(),
          CustomTextFormField(
            onSaved: (value) {
              password = value!;
            },
            hintText: 'Password',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          HeightSpace(height: 30),
          RemeberForgetPasswordSection(),
          HeightSpace(height: 30),
          CustomButton(
            isLoading: context.watch<SignInCubit>().state is SignInLoading,
            text: 'Sign In',
            onPressed: () {
              _formKey.currentState!.save();
              if (_formKey.currentState!.validate()) {
                log(email);
                context.read<SignInCubit>().signIn(
                  email: email,
                  password: password,
                );
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          // HeightSpace(),
          // CustomButton(
          //   textColor: AppColors.kPrimaryColor,
          //   borderColor: AppColors.kPrimaryColor,
          //   backgroundColor: AppColors.kStokeColor,
          //   text: 'Sign Up',
          //   onPressed: () {
          //     Navigator.pushNamed(context, Routes.kSignUpView);
          //   },
          // ),
        ],
      ),
    );
  }
}
