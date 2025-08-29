import 'package:car_rental/Feature/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:car_rental/Feature/on_boarding/presentation/components/on_boarding_background.dart';
import 'package:car_rental/Feature/on_boarding/presentation/components/on_boarding_content.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.onBoardingEntity});

  final OnBoardingEntity onBoardingEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnBoardingBackground(image: onBoardingEntity.image),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: OnBoardingContent(onBoardingEntity: onBoardingEntity,),
        ),
      ],
    );
  }
}
