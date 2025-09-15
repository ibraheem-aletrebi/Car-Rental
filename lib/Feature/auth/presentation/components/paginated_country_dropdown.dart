import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';

class PaginatedCountryDropdown extends StatefulWidget {
  const PaginatedCountryDropdown({
    super.key,
    required this.onChanged,
    this.isEnabled = true,
    this.initialValue,
  });
  final ValueChanged<CountryModel?> onChanged;
  final bool isEnabled;
  final CountryModel? initialValue;
  @override
  State<PaginatedCountryDropdown> createState() =>
      _PaginatedCountryDropdownState();
}

class _PaginatedCountryDropdownState extends State<PaginatedCountryDropdown> {
  CountryModel? selectedCountry;
  final GlobalKey<FormFieldState<CountryModel>> _formKey =
      GlobalKey<FormFieldState<CountryModel>>();

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
          padding: const EdgeInsets.all(10),
          child: Text(
            selectedCountry == null
                ? widget.initialValue == null
                      ? '+0'
                      : '+${widget.initialValue?.id.toString()}'
                : '+${selectedCountry!.id.toString()}',
            style: AppStyles.semiBold14.copyWith(color: AppColors.kWhiteColor),
          ),
        ),
        Expanded(
          child: PaginatedSearchDropdownFormField<CountryModel>.paginated(
            isEnabled: widget.isEnabled,

            initialValue: widget.initialValue == null
                ? null
                : MenuItemModel<CountryModel>(
                    value: widget.initialValue,
                    label: widget.initialValue!.country,
                    child: _countryWidget(widget.initialValue!),
                  ),
            formKey: _formKey,
            requestItemCount: 5,
       
            trailingClearIcon: Icon(
              FontAwesomeIcons.trash,
              color: AppColors.kSecondaryColor,
            ),
            dropDownMaxHeight: MediaQuery.sizeOf(context).height / 3,

            backgroundDecoration: (child) => _buildBackgroundDecoration(child),
            hintText: Text(' Country', style: AppStyles.regular14),
            paginatedRequest: (int page, String? searchText) async {
              final paginatedList = await _fetchCountries(
                searchQuery: searchText,
              );
              return paginatedList.map((e) {
                return MenuItemModel<CountryModel>(
                  value: e,
                  label: e.country,
                  child: _countryWidget(e),
                );
              }).toList();
            },
            validator: (val) {
              if (val == null) return 'Can\'t be empty';
              return null;
            },
            onChanged: (CountryModel? value) {
              widget.onChanged(value);
              setState(() {
                selectedCountry = value;
              });
            },
            onSaved: (value) {
              selectedCountry = value;
            },
          ),
        ),
      ],
    );
  }

  Row _countryWidget(CountryModel e) {
    return Row(
      children: [
        Text(e.abbreviation, style: AppStyles.regular14),
        const SizedBox(width: 10),
        Text(e.country, style: AppStyles.regular14),
      ],
    );
  }

  InputDecorator _buildBackgroundDecoration(Widget child) => InputDecorator(
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.kWhiteColor,
      border: _buildBorder(),
      enabledBorder: _buildBorder(),
      focusedBorder: _buildBorder(),
      errorBorder: _buildBorder(color: Colors.red),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
    ),
    child: child,
  );

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: color ?? AppColors.kStokeColor, width: 2),
    );
  }

  Future<List<CountryModel>> _fetchCountries({
    String? searchQuery,
    int page = 1,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // Simulate network delay

    final allCountries = [
      CountryModel(id: 20, country: 'Egypt', abbreviation: 'EG'),
      CountryModel(id: 966, country: 'Saudi Arabia', abbreviation: 'SA'),
      CountryModel(
        id: 971,
        country: 'United Arab Emirates',
        abbreviation: 'AE',
      ),
      CountryModel(id: 962, country: 'Jordan', abbreviation: 'JO'),
      CountryModel(id: 965, country: 'Kuwait', abbreviation: 'KW'),
      CountryModel(id: 974, country: 'Qatar', abbreviation: 'QA'),
      CountryModel(id: 968, country: 'Oman', abbreviation: 'OM'),
      CountryModel(id: 973, country: 'Bahrain', abbreviation: 'BH'),
    ];

    if (searchQuery != null && searchQuery.isNotEmpty) {
      return allCountries
          .where(
            (country) => country.country.toLowerCase().contains(
              searchQuery.toLowerCase(),
            ),
          )
          .toList();
    }

    final startIndex = (page - 1) * 5;
    final endIndex = startIndex + 5;

    if (startIndex >= allCountries.length) {
      return [];
    }

    return allCountries.sublist(
      startIndex,
      endIndex.clamp(0, allCountries.length),
    );
  }
}
