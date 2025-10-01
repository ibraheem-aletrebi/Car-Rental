import 'package:car_rental/Feature/home/presentation/components/car_brands_list_view_builder.dart';
import 'package:car_rental/Feature/home/presentation/components/car_brands_loading_section.dart';
import 'package:car_rental/Feature/home/presentation/manager/brand_cubit/brands_cubit.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarBrands extends StatelessWidget {
  const CarBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: BlocBuilder<BrandsCubit, BrandsState>(
        builder: (context, state) {
          if (state is BrandsErrorState) {
            return Center(child: Text(state.message));
          } else if (state is BrandsLoadedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Brands', style: AppStyles.semiBold16),
                const HeightSpace(),
                CarBrandsListViewBuilder(brands: state.brands),
              ],
            );
          } else {
            return CarBrandsLoadingSection();
          }
        },
      ),
    );
  }
}
