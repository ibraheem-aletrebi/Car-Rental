import 'package:car_rental/Feature/home/presentation/components/car_brand_item.dart';
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
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Brands', style: AppStyles.semiBold16),
              const HeightSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  state is BrandsLoadedState ? state.brands.length : 4,
                  (index) => state is BrandsLoadedState
                      ? CarBrandItem(brandModel: state.brands[index])
                      : CardBrandItemLoadingWidget(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
