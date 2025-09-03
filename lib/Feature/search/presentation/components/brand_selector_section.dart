import 'package:car_rental/Feature/search/domain/entities/brand_entity.dart';
import 'package:car_rental/Feature/search/presentation/components/brand_item.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:flutter/material.dart';

class BrandSelectorSection extends StatefulWidget {
  const BrandSelectorSection({super.key});

  @override
  State<BrandSelectorSection> createState() => _BrandSelectorSectionState();
}

class _BrandSelectorSectionState extends State<BrandSelectorSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(10, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: BrandItem(
                isSelected: selectedIndex == index,
                brandEntity: BrandEntity(name: 'BMW', image: Assets.imagesBmw),
              ),
            );
          }),
        ),
      ),
    );
  }
}
