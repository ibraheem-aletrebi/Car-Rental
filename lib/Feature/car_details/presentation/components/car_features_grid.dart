import 'package:car_rental/Feature/car_details/presentation/components/car_feature_card.dart';
import 'package:flutter/cupertino.dart';

class CarFeaturesGrid extends StatelessWidget {
  const CarFeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) => CarFeatureCard(
        value: 'Transmission',
        title: 'Automatic',
        icon: CupertinoIcons.gear,
      ),
      itemCount: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
