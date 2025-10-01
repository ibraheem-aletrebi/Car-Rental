import 'package:car_rental/Feature/home/presentation/components/loading_header.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';

class NearbyLoadingSection extends StatelessWidget {
  const NearbyLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoadingHeader(),
        HeightSpace(),
        HeightSpace(),
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 7.5,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => NearbyItemLoading(),
            separatorBuilder: (context, index) => WidthSpace(),
            itemCount: 12,
          ),
        ),
      ],
    );
  }
}

class NearbyItemLoading extends StatelessWidget {
  const NearbyItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 321 / 121,
      child: Container(color: Colors.grey.shade300),
    );
  }
}
