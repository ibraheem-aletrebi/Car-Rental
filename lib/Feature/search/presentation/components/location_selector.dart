import 'package:car_rental/core/cubits/user_cubit/user_cubit.dart';
import 'package:car_rental/core/widgets/paginated_location_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        const Text(
          'Car Location',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        PaginatedLocationDropdown(
          onChanged: (value) {},
          initialValue: context.read<UserCubit>().user?.location,
        ),
      ],
    );
  }
}
