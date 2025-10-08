import 'package:car_rental/Feature/car_details/presentation/components/car_images.dart';
import 'package:flutter/cupertino.dart';

class CarDetailsViewBody extends StatelessWidget {
  const CarDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CarImages()]);
  }
}
