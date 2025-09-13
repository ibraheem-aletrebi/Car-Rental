import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/Feature/auth/data/model/user_model.dart';
import 'package:car_rental/Feature/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:car_rental/Feature/auth/presentation/components/paginated_country_dropdown.dart';
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
  var formKey = GlobalKey<FormState>();
  String? fullName, email, phone, password;
  CountryModel? countryModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Full Name',
            onSaved: (value) {
              fullName = value;
            },
          ),
          HeightSpace(),
          CustomTextFormField(
            hintText: 'Email',
            onSaved: (value) {
              email = value;
            },
          ),
          HeightSpace(),
          CustomTextFormField(hintText: 'Phone Number'),
          HeightSpace(),
          CustomTextFormField(
            onSaved: (value) {
              password = value;
            },
            hintText: 'Password',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          HeightSpace(),
          PaginatedCountryDropdown(onChanged: (value) {}),
          HeightSpace(height: 30),
          CustomButton(
            isLoading: context.watch<SignUpCubit>().state is SignUpLoading,
            text: 'Sign up',
            onPressed: () {
              formKey.currentState?.save();
              if (formKey.currentState!.validate()) {
                context.read<SignUpCubit>().signUp(
                  userModel: UserModel(
                    null,
                    null,
                    fullName: fullName!,
                    email: email!,
                    password: password!,
                  ),
                );
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
