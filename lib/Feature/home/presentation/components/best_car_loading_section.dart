import 'package:car_rental/Feature/home/presentation/components/best_car_item_loading.dart';
import 'package:car_rental/Feature/home/presentation/components/loading_text.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';

class BestCarLoadingSection extends StatelessWidget {
  const BestCarLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [LoadingText(), LoadingText()],
        ),
        HeightSpace(),

        LoadingText(),
        HeightSpace(height: 18),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .28,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => BestCarItemLoading(),
            separatorBuilder: (context, index) => WidthSpace(),
            itemCount: 12,
          ),
        ),
      ],
    );
  }
}
