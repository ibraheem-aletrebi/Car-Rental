import 'package:car_rental/Feature/auth/domain/repo/location_repo.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/data/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';

class PaginatedLocationDropdown extends StatefulWidget {
  const PaginatedLocationDropdown({
    super.key,
    required this.onChanged,
    this.isEnabled = true,
    this.initialValue,
  });
  final ValueChanged<LocationModel?> onChanged;
  final bool isEnabled;
  final LocationModel? initialValue;
  @override
  State<PaginatedLocationDropdown> createState() =>
      _PaginatedCountryDropdownState();
}

class _PaginatedCountryDropdownState extends State<PaginatedLocationDropdown> {
  LocationModel? selectedLocation;
  final GlobalKey<FormFieldState<LocationModel>> _formKey =
      GlobalKey<FormFieldState<LocationModel>>();
  MenuItemModel<LocationModel>? selectedMenuItem;
  @override
  void initState() {
    if (widget.initialValue != null) {
      selectedLocation = widget.initialValue!;
      selectedMenuItem = MenuItemModel<LocationModel>(
        value: widget.initialValue!,
        label: widget.initialValue!.name,
        child: _locationWidget(widget.initialValue!),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedSearchDropdownFormField<LocationModel>.paginated(
      padding: EdgeInsets.zero,
      isEnabled: widget.isEnabled,
      initialValue: selectedMenuItem,
      formKey: _formKey,
      requestItemCount: 5,
      leadingIcon: Icon(Icons.location_on_outlined),

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
              (e) => MenuItemModel<LocationModel>(
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
      onChanged: (LocationModel? value) {
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

  Text _locationWidget(LocationModel e) {
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
      contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
    ),
    child: child,
  );

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: color ?? AppColors.kStokeColor, width: 2),
    );
  }

  Future<List<LocationModel>?> _fetchLocations({int page = 1}) async {
    final result = await getIt<LocationRepo>().fetchLocations(page: page);
    return result;
  }
}
