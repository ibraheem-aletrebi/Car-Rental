import 'package:car_rental/Feature/auth/data/model/location_response_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/location_repo.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';

class PaginatedLocationDropdown extends StatefulWidget {
  const PaginatedLocationDropdown({
    super.key,
    required this.onChanged,
    this.isEnabled = true,
    this.initialValue,
  });
  final ValueChanged<LocationResponseModel?> onChanged;
  final bool isEnabled;
  final LocationResponseModel? initialValue;
  @override
  State<PaginatedLocationDropdown> createState() =>
      _PaginatedCountryDropdownState();
}

class _PaginatedCountryDropdownState extends State<PaginatedLocationDropdown> {
  LocationResponseModel? selectedLocation;
  final GlobalKey<FormFieldState<LocationResponseModel>> _formKey =
      GlobalKey<FormFieldState<LocationResponseModel>>();
  @override
  Widget build(BuildContext context) {
    return PaginatedSearchDropdownFormField<LocationResponseModel>.paginated(
      isEnabled: widget.isEnabled,

      initialValue: widget.initialValue == null
          ? null
          : MenuItemModel<LocationResponseModel>(
              value: widget.initialValue,
              label: widget.initialValue!.name,
              child: _locationWidget(widget.initialValue!),
            ),
      formKey: _formKey,
      requestItemCount: 5,
      trailingClearIcon: Icon(
        FontAwesomeIcons.trash,
        color: AppColors.kSecondaryColor,
      ),
      dropDownMaxHeight: MediaQuery.sizeOf(context).height / 3,
      backgroundDecoration: (child) => _buildBackgroundDecoration(child),
      hintText: Text('Your Location', style: AppStyles.regular14),

      paginatedRequest: (int page, String? searchText) async {
        final result = await _fetchLocations(page: page);
        return result
            ?.map(
              (e) => MenuItemModel<LocationResponseModel>(
                value: e,
                label: e.name,
                child: _locationWidget(e),
              ),
            )
            .toList();
      },
      validator: (val) {
        if (val == null) return 'Can\'t be empty';
        return null;
      },
      onChanged: (LocationResponseModel? value) {
        widget.onChanged(value);
        setState(() {
          selectedLocation = value;
        });
      },
      onSaved: (value) {
        selectedLocation = value;
      },
    );
  }

  Text _locationWidget(LocationResponseModel e) {
    return Text(e.name, style: AppStyles.regular14);
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

  Future<List<LocationResponseModel>?> _fetchLocations({int page = 1}) async {
    final result = await getIt<LocationRepo>().fetchLocations(page: page);

    return result;
  }
}
