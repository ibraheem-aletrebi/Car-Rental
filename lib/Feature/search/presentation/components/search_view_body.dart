import 'package:car_rental/Feature/search/presentation/components/search_with_filter_section.dart';
import 'package:car_rental/Feature/search/presentation/components/brand_selector_section.dart';
import 'package:car_rental/Feature/search/presentation/components/popular_section.dart';
import 'package:car_rental/Feature/search/presentation/components/recommended_section.dart';
import 'package:car_rental/Feature/search/presentation/components/search_view_app_bar.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SearchViewAppBar(),
              HeightSpace(height: 20),
              Divider(color: AppColors.kStokeColor),
              HeightSpace(),
              SearchWithFilterBar(),
              HeightSpace(height: 28),
              BrandSelectorSection(),
              HeightSpace(height: 28),
            ],
          ),
        ),
        SliverToBoxAdapter(child: RecommendedSection()),
         SliverToBoxAdapter(child: HeightSpace(height: 28)),
         SliverToBoxAdapter(child: PopularSection()),
         SliverToBoxAdapter(child: HeightSpace(height: 120)),
      ],
    );
  }
}
