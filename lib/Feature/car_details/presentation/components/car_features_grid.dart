import 'package:car_rental/Feature/car_details/presentation/components/car_feature_card.dart';
import 'package:car_rental/Feature/car_details/presentation/manager/car_details/car_details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarFeaturesGrid extends StatelessWidget {
  const CarFeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var car = context.read<CarDetailsCubit>().car;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.2.sp,
      ),
      itemCount: car?.carFeatures.length ?? 4,
      itemBuilder: (context, index) => CarFeatureCard(
        title: car?.carFeatures[index].name ?? '',
        value: car?.carFeatures[index].value ?? '',
        imagePath: car?.carFeatures[index].image ?? '',
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
