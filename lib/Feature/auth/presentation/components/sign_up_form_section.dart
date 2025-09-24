
import 'package:car_rental/Feature/auth/data/model/sign_up_request_model.dart';
import 'package:car_rental/Feature/auth/presentation/components/available_to_add_car_widget.dart';
import 'package:car_rental/Feature/auth/presentation/components/paginated_country_dropdown.dart';
import 'package:car_rental/Feature/auth/presentation/components/paginated_location_dropdown.dart';
import 'package:car_rental/Feature/auth/presentation/manager/cubit/signup_cubit.dart';
import 'package:car_rental/core/enums/avialable_add_car.dart';
import 'package:car_rental/core/helper/validator.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupCubit.get(context);
    return Form(
      key: controller.formKey,
      autovalidateMode: controller.autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Full Name',
            onSaved: (value) => controller.changeFullName(value!),
            validator: (value) => Validator.required(value),
          ),
          HeightSpace(),
          CustomTextFormField(
            hintText: 'Email',
            onSaved: (value) => controller.changeEmail(value!),
            validator: (value) => Validator.email(value),
            keyboardType: TextInputType.emailAddress,
          ),
          HeightSpace(),
          CustomTextFormField(
            hintText: 'Phone Number',
            validator: (value) => Validator.number(value),
            onSaved: (value) => controller.changePhone(value!),
            keyboardType: TextInputType.phone,
          ),
          HeightSpace(),
          CustomTextFormField(
            onSaved: (value) => controller.changePassword(value!),
            hintText: 'Password',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => Validator.password(value, minLength: 8),
          ),
          HeightSpace(),
          PaginatedLocationDropdown(
            onChanged: (value) => controller.changeLocation(value!),
          ),
          HeightSpace(),
          PaginatedCountryDropdown(
            onChanged: (value) => controller.changeCountry(value!),
          ),
          HeightSpace(),
          AvailableToAddCarWidget(),
          HeightSpace(height: 30),
          CustomButton(
            isLoading: context.watch<SignupCubit>().state is SignupLoading,
            text: 'Sign up',
            onPressed: () {
              controller.formKey.currentState?.save();

              if (controller.formKey.currentState!.validate()) {
                context.read<SignupCubit>().signUp(
                  signUpRequestModel: SignUpRequestModel(
                    fullName: controller.fullName!,
                    email: controller.email!,
                    phoneNumber: controller.phone!,
                    password: controller.password!,
                    locationId: controller.locationModel!.id,
                    countryId: controller.countryModel!.id,
                    isAvialableToAddCar: controller.availableToAddCar == AvailableToAddCar.yes ? 1 : 0,
                  )
                );
              } else {
                SignupCubit.get(context).toggleAutovalidateMode();
              }
              // Navigator.pushNamed(context, Routes.kVerifyPhoneNumberView);
            },
          ),

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
