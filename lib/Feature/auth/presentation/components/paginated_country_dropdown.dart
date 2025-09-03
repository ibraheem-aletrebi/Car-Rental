import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';

class PaginatedCountryDropdown extends StatelessWidget {
  const PaginatedCountryDropdown({super.key, required this.onChanged});
  final ValueChanged<CountryModel?> onChanged;
  @override
  Widget build(BuildContext context) {
    return HighQPaginatedDropdown<CountryModel>.paginated(
      requestItemCount: 5,
      trailingClearIcon: Icon(
        FontAwesomeIcons.trash,
        color: AppColors.kSecondaryColor,
      ),

      dropDownMaxHeight: MediaQuery.sizeOf(context).height / 3,
      backgroundDecoration: (child) => _buildBackgroundDecoration(child),
      hintText: Text(' Country', style: AppStyles.regular14),
      paginatedRequest: (int page, String? searchText) async {
        final paginatedList = await _fetchCountries(searchQuery: searchText);
        return paginatedList.map((e) {
          return MenuItemModel<CountryModel>(
            value: e,
            label: e.countryName,
            child: _countryWidget(e),
          );
        }).toList();
      },

      onChanged: (CountryModel? value) {
        onChanged(value);
      },
    );
  }

  Row _countryWidget(CountryModel e) {
    return Row(
      children: [
        Image.network(e.imageUrl, width: 24, height: 16),
        const SizedBox(width: 10),
        Text(e.countryName, style: AppStyles.regular14),
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
    // TODO: Replace with actual API call
    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // Simulate network delay

    final allCountries = [
      CountryModel(
        countryCode: 20,
        countryName: 'Egypt',
        imageUrl: 'https://flagcdn.com/w320/eg.png',
      ),
      CountryModel(
        countryCode: 966,
        countryName: 'Saudi Arabia',
        imageUrl: 'https://flagcdn.com/w320/sa.png',
      ),
      CountryModel(
        countryCode: 971,
        countryName: 'United Arab Emirates',
        imageUrl: 'https://flagcdn.com/w320/ae.png',
      ),
      CountryModel(
        countryCode: 962,
        countryName: 'Jordan',
        imageUrl: 'https://flagcdn.com/w320/jo.png',
      ),
      CountryModel(
        countryCode: 965,
        countryName: 'Kuwait',
        imageUrl: 'https://flagcdn.com/w320/kw.png',
      ),
      CountryModel(
        countryCode: 974,
        countryName: 'Qatar',
        imageUrl: 'https://flagcdn.com/w320/qa.png',
      ),
      CountryModel(
        countryCode: 968,
        countryName: 'Oman',
        imageUrl: 'https://flagcdn.com/w320/om.png',
      ),
      CountryModel(
        countryCode: 973,
        countryName: 'Bahrain',
        imageUrl: 'https://flagcdn.com/w320/bh.png',
      ),
    ];

    if (searchQuery != null && searchQuery.isNotEmpty) {
      return allCountries
          .where(
            (country) => country.countryName.toLowerCase().contains(
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
