import 'package:car_rental/Feature/home/presentation/components/custom_bottom_navigation_bar.dart';
import 'package:car_rental/Feature/home/presentation/view/home_view.dart';
import 'package:car_rental/Feature/search/presentation/view/search_view.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    if (index == _currentIndex) return; // avoid unnecessary rebuilds
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.kDarkWhite,
          child: IndexedStack(
            index: _currentIndex,
            children: [HomeView(), SearchView(), HomeView()],
          ),
        ),
        Positioned(
          left: 0,
          bottom: 20,
          right: 0,
          child: CustomBottomNavigationBar(
            onTabSelected: _onTabSelected,
            currentIndex: _currentIndex,
          ),
        ),
      ],
    );
  }
}
