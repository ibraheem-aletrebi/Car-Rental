import 'package:car_rental/Feature/car_details/presentation/components/book_car_button.dart';
import 'package:car_rental/Feature/car_details/presentation/components/car_details_body_content.dart';
import 'package:car_rental/Feature/car_details/presentation/components/car_details_sliver_app_bar.dart';
import 'package:car_rental/Feature/car_details/presentation/components/car_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetailsViewBody extends StatelessWidget {
  const CarDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const CarDetailsSliverAppBar(),
            const SliverToBoxAdapter(child: CarImages()),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              sliver: SliverToBoxAdapter(child: CarDetailsBodyContent()),
            ),
          ],
        ),
        const BookCarButton(),
      ],
    );
  }
}
