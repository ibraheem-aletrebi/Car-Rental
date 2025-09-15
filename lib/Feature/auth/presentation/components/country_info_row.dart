import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CountryInfoRow extends StatelessWidget {
  const CountryInfoRow({super.key, required this.countryModel});
  final CountryModel countryModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.kSecondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            '+${countryModel.id.toString()}',
            style: AppStyles.semiBold14.copyWith(color: AppColors.kWhiteColor),
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            initialValue: countryModel.country,
            enabled: false,
            hintText: 'Country',
          ),
        ),
      ],
    );
  }
}
