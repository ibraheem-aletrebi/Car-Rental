import 'package:car_rental/Feature/home/presentation/components/nearby_item.dart';
import 'package:car_rental/Feature/home/presentation/components/nearby_loading_section.dart';
import 'package:car_rental/Feature/home/presentation/components/section_header.dart';
import 'package:car_rental/Feature/home/presentation/manager/nearby_cars_cubit/nearby_cars_cubit.dart';
import 'package:car_rental/core/models/car_model.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NearbySection extends StatefulWidget {
  const NearbySection({super.key});

  @override
  State<NearbySection> createState() => _NearbySectionState();
}

class _NearbySectionState extends State<NearbySection> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _onScrollEndReached();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearbyCarsCubit, NearbyCarsState>(
      builder: (context, state) {
        if (state is NearbyCarsErrorState) {
          return Center(child: Text(state.message));
        }
        if (state is NearbyCarsLoadingState) {
          return const NearbyLoadingSection();
        }
        if (state is NearbyCarsLoadedState) {
          final List<CarModel> cars = state.cars;
          final bool hasMore = state.hasMore;
          return _buildList(cars, hasMore);
        }
        if (state is NearbyCarsLoadingMoreState) {
          final List<CarModel> cars = state.cars;
          final bool hasMore = context.read<NearbyCarsCubit>().hasMore;
          return _buildList(cars, hasMore);
        }
        return const NearbyLoadingSection();
      },
    );
  }

  Widget _buildList(List<CarModel> cars, bool hasMore) {
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
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index < cars.length) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.kCarDetailsView,
                      arguments: cars[index].id,
                    );
                  },
                  child: NearbyItem(imagePath: cars[index].firstImage),
                );
              } else {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              }
            },
            separatorBuilder: (context, index) => const WidthSpace(),
            itemCount: cars.length + (hasMore ? 1 : 0),
          ),
        ),
      ],
    );
  }

  void _onScrollEndReached() {
    final cubit = context.read<NearbyCarsCubit>();
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !cubit.isLoadingMore &&
        cubit.hasMore) {
      cubit.fetchNearbyCars(loadMore: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
