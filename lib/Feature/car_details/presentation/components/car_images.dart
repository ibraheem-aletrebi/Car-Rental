import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarImages extends StatefulWidget {
  const CarImages({super.key});

  @override
  State<CarImages> createState() => _ProductImagesWidgetState();
}

class _ProductImagesWidgetState extends State<CarImages> {
  bool _showThumbnails = true;
  Timer? _hideTimer;
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<String> images = [
    'https://picsum.photos/id/1018/800/600',
    'https://picsum.photos/id/1015/800/600',
    'https://picsum.photos/id/1016/800/600',
    'https://picsum.photos/id/1020/800/600',
    'https://picsum.photos/id/1021/800/600',
    'https://picsum.photos/id/1022/800/600',
    'https://picsum.photos/id/1023/800/600',
    'https://picsum.photos/id/1024/800/600',
  ];

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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _resetTimer,
      onPanDown: (_) => _resetTimer(),
      child: Column(
        children: [
          Stack(
            children: [
              // ✅ الصور الكبيرة بقت Scrollable
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.4,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedIndex = index;
                      _resetTimer();
                    });
                  },
                  itemBuilder: (context, index) => CachedNetworkImage(
                    imageUrl: images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // زر رجوع
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),

              // زر wishlist
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
              ),

              // ✅ مؤشر أسفل الصور
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
                      count: images.length,
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

              // ✅ لو مش أول صورة، أظهر الـ thumbnails
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
                        itemCount: images.length,
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
                                    imageUrl: images[index],
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
