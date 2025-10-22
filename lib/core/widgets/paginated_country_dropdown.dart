import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/core/resources/app_strings_keys.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
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

  MenuItemModel<CountryModel>? selectedMenuItem;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      selectedCountry = widget.initialValue!;
      selectedMenuItem = MenuItemModel<CountryModel>(
        value: widget.initialValue!,
        label: widget.initialValue!.country,
        child: Text(" ${widget.initialValue!.country}"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedSearchDropdownFormField<CountryModel>.paginated(
      isEnabled: widget.isEnabled,
      formKey: _formKey,
      padding: EdgeInsets.zero,
      initialValue: selectedMenuItem,
      requestItemCount: 5,
      leadingIcon: Text(
        countryCodeToEmoji(selectedCountry?.abbreviation ?? ''),
        style: const TextStyle(fontSize: 24),
      ),
      trailingClearIcon: Icon(
        FontAwesomeIcons.trash,
        color: AppColors.kSecondaryColor,
      ),
      dropDownMaxHeight: MediaQuery.sizeOf(context).height / 5,
      backgroundDecoration: (child) => _buildBackgroundDecoration(child),
      hintText: Text(
        context.tr(AppStringsKeys.country),
        style: AppStyles.regular14,
      ),
      paginatedRequest: (int page, String? searchText) async {
        final result = await _fetchCountries(page: page);
        return result
            ?.map(
              (e) => MenuItemModel<CountryModel>(
                value: e,
                label: e.country,
                child: Text(" ${e.country}"),
              ),
            )
            .toList();
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
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    ),
    child: child,
  );

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: color ?? AppColors.kStokeColor, width: 2),
    );
  }

  Future<List<CountryModel>?> _fetchCountries({int page = 1}) async {
    final result = await getIt<AuthRepo>().fetchCountries(page: page);
    return result.fold((failure) => null, (countries) => countries);
  }

  String countryCodeToEmoji(String countryCode) {
    if (countryCode.isEmpty) return '';
    final codePoints = countryCode.toUpperCase().codeUnits.map(
      (unit) => unit + 127397,
    );
    return String.fromCharCodes(codePoints);
  }
}
