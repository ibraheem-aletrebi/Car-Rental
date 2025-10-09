import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/Feature/car_details/presentation/manager/car_details/car_details_cubit.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/assets.dart';
import 'package:car_rental/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarImages extends StatefulWidget {
  const CarImages({super.key,});
 
  @override
  State<CarImages> createState() => _ProductImagesWidgetState();
}

class _ProductImagesWidgetState extends State<CarImages> {
  bool _showThumbnails = true;
  Timer? _hideTimer;
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _resetTimer() {
    setState(() => _showThumbnails = true);
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() => _showThumbnails = false);
    });
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    var car=context.read<CarDetailsCubit>().car;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _resetTimer,
      onPanDown: (_) => _resetTimer(),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.4,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: car.images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedIndex = index;
                      _resetTimer();
                    });
                  },
                  itemBuilder: (context, index) => CachedNetworkImage(
                    imageUrl: car.images[index],
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: CustomIconButton(
                  backgroundColor: AppColors.kWhiteColor,
                  onPressed: () {},
                  iconPath: Assets.iconsFavorate,
                  padding: 16,
                ),
              ),

              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: car.images.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 6,
                        activeDotColor: AppColors.kPrimaryColor,
                        dotColor: AppColors.kStokeColor,
                      ),
                    ),
                  ),
                ),
              ),

              if (_selectedIndex != 0)
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: AnimatedOpacity(
                    opacity: _showThumbnails ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: car.images.length,
                        itemBuilder: (context, index) {
                          final isSelected = index == _selectedIndex;
                          return GestureDetector(
                            onTap: () {
                              _pageController.jumpToPage(index);
                            },
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(end: 8),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.kWhiteColor
                                        : Colors.transparent,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: CachedNetworkImage(
                                    imageUrl:car.images[index],
                                    height: 100.h,
                                    width: 100.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
