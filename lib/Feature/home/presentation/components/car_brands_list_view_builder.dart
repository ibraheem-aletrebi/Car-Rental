import 'package:car_rental/Feature/home/presentation/components/car_brand_item.dart';
import 'package:car_rental/data/models/brand_model.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';

class CarBrandsListViewBuilder extends StatelessWidget {
  const CarBrandsListViewBuilder({super.key, required this.brands});
  final List<BrandModel> brands;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .1,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => WidthSpace(width: 22),
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) =>
            CarBrandItem(brandModel: brands[index]),
      ),
    );
  }
}
