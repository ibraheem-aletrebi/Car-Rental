import 'package:car_rental/Feature/home/presentation/components/home_app_bar.dart';
import 'package:car_rental/Feature/home/presentation/components/home_body.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        Divider(color: AppColors.kStokeColor),
        HeightSpace(),
        Expanded(child: HomeBody()),
      ],
    );
  }
}
