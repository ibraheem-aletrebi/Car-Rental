import 'package:car_rental/Feature/home/presentation/components/nearby_item.dart';
import 'package:car_rental/Feature/home/presentation/components/nearby_loading_section.dart';
import 'package:car_rental/Feature/home/presentation/components/section_header.dart';
import 'package:car_rental/Feature/home/presentation/manager/nearby_cars_cubit/nearby_cars_cubit.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NearbySection extends StatelessWidget {
  const NearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearbyCarsCubit, NearbyCarsState>(
      builder: (context, state) {
        if (state is NearbyCarsErrorState) {
          return Center(child: Text(state.message));
        } else if (state is NearbyCarsLoadedState) {
          return Column(
            children: [
              SectionHeader(
                title: 'Nearby ',
                actionText: 'View All',
                onActionPressed: () {},
              ),
              HeightSpace(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 7.5,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      NearbyItem(imagePath: state.cars[index].image),
                  separatorBuilder: (context, index) => WidthSpace(),
                  itemCount: state.cars.length,
                ),
              ),
            ],
          );
        } else {
          return const NearbyLoadingSection();
        }
      },
    );
  }
}
