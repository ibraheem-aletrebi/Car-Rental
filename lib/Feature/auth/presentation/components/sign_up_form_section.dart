import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/Feature/auth/presentation/components/paginated_country_dropdown.dart';
import 'package:car_rental/Feature/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormSection extends StatefulWidget {
  const SignUpFormSection({super.key});

  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? fullName, email, phone, password;
  CountryModel? countryModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Full Name',
            onSaved: (value) {
              fullName = value;
            },
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Full name is required';
              }
              return null;
            },
          ),
          HeightSpace(),
          CustomTextFormField(
            hintText: 'Email',
            onSaved: (value) {
              email = value;
            },
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Full name is required';
              }
              return null;
            },
          ),
          HeightSpace(),
          CustomTextFormField(
            hintText: 'Phone Number',
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Full name is required';
              }
              return null;
            },
            onSaved: (value) {
              phone = value;
            },
          ),
          HeightSpace(),
          CustomTextFormField(
            onSaved: (value) {
              password = value;
            },
            hintText: 'Password',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Full name is required';
              }
              return null;
            },
          ),
          HeightSpace(),

          PaginatedCountryDropdown(
            onChanged: (value) {
              setState(() {
                countryModel = value;
              });
            },
          ),
          HeightSpace(height: 30),
          CustomButton(
            isLoading: context.watch<SignUpCubit>().state is SignUpLoading,
            text: 'Sign up',
            onPressed: () {
              _formKey.currentState?.save();

              if (_formKey.currentState!.validate()) {
                context.read<SignUpCubit>().signUp(
                  userModel: UserModel(
                    country: countryModel!,
                    phone: phone!,
                    fullName: fullName!,
                    email: email!,
                  ),
                  password: password!,
                );
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              }
              // Navigator.pushNamed(context, Routes.kVerifyPhoneNumberView);
            },
          ),
          // HeightSpace(),
          // CustomButton(
          //   textColor: AppColors.kPrimaryColor,
          //   borderColor: AppColors.kPrimaryColor,
          //   backgroundColor: AppColors.kStokeColor,
          //   text: 'Sign In',
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
