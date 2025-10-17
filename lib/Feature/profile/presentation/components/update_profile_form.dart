import 'package:car_rental/Feature/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:car_rental/core/enums/avialable_add_car.dart';
import 'package:car_rental/core/utils/helper/validator.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/custom_to_option_selector.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/paginated_country_dropdown.dart';
import 'package:car_rental/core/widgets/paginated_location_dropdown.dart';
import 'package:car_rental/core/widgets/user_avater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileForm extends StatelessWidget {
  const UpdateProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<ProfileCubit>();
    var user = controller.user;
    return Form(
      key: controller.profileFormKey,
      autovalidateMode: controller.autovalidateMode,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              UserAvatar(
                radius: 60.r,
                // imageUrl: user.imageUrl ?? '',
                username: user.fullName,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(Icons.edit, size: 18.sp, color: Colors.grey[700]),
                ),
              ),
            ],
          ),
          HeightSpace(height: 8),
          Text(
            user.fullName,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          HeightSpace(),
          CustomTextFormField(
            hintText: 'Full Name',
            initialValue: user.fullName,
            validator: (value) =>
                Validator.required(value, fieldName: 'Your name'),
            onSaved: (value) {
              controller.updateUser(fullName: value);
            },
          ),
          HeightSpace(),
          CustomTextFormField(
            hintText: 'Email',
            initialValue: user.email,
            validator: (value) => Validator.email(value),
            onSaved: (value) {
              controller.updateUser(email: value);
            },
          ),
          HeightSpace(),
          CustomTextFormField(
            hintText: 'Phone',
            initialValue: user.phone,
            validator: (value) => Validator.number(value),
            onSaved: (value) {
              controller.updateUser(phone: value);
            },
          ),
          HeightSpace(),
          PaginatedCountryDropdown(
            onChanged: (value) {
              controller.updateUser(country: value);
            },
            initialValue: user.country,
          ),
          HeightSpace(),
          PaginatedLocationDropdown(
            onChanged: (value) {
              controller.updateUser(location: value);
            },
            initialValue: user.location,
          ),
          HeightSpace(),
          CustomTwoOptionSelector<AvailableToAddCar>(
            title: 'Available to add car',
            initialValue: user.availableToCreateCar,
            firstValue: AvailableToAddCar.no,
            secondValue: AvailableToAddCar.yes,
            firstLabel: 'No',
            secondLabel: 'Yes',
            firstIcon: Icons.close,
            secondIcon: Icons.check,
            onChanged: (value) =>
                controller.updateUser(availableToAddCar: value),
          ),
        ],
      ),
    );
  }
}
