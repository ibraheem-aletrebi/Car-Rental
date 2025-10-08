import 'package:car_rental/Feature/home/presentation/components/best_car_item.dart';
import 'package:car_rental/Feature/home/presentation/components/best_car_loading_section.dart';
import 'package:car_rental/Feature/home/presentation/components/section_header.dart';
import 'package:car_rental/Feature/home/presentation/manager/best_car_cubit/best_car_cubit.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rental/core/models/car_model.dart';

class BestCarsSection extends StatefulWidget {
  const BestCarsSection({super.key});
  @override
  State<BestCarsSection> createState() => _BestCarsSectionState();
}

class _BestCarsSectionState extends State<BestCarsSection> {
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
    return BlocBuilder<BestCarCubit, BestCarState>(
      builder: (context, state) {
        if (state is BestCarErrorState) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is BestCarLoadingState) {
          return const BestCarLoadingSection();
        }
        if (state is BestCarSuccessState) {
          final List<CarModel> cars = state.cars;
          final bool hasMore = state.hasMore;
          return _buildList(cars, hasMore);
        }
        if (state is BestCarLoadingMoreState) {
          final List<CarModel> cars = state.cars;
          final bool hasMore = context.read<BestCarCubit>().hasMore;
          return _buildList(cars, hasMore);
        }
        return const BestCarLoadingSection();
      },
    );
  }

  Widget _buildList(List<CarModel> cars, bool hasMore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Best Cars',
          actionText: 'View All',
          onActionPressed: () {},
        ),
        const HeightSpace(),
        Text('Available', style: AppStyles.regular12),
        const HeightSpace(height: 18),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .28,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index < cars.length) {
                return GestureDetector( 
                  onTap: () {
                    Navigator.pushNamed(context, Routes.kCarDetailsView,
                        arguments: cars[index].id);
                  },
                  child: BestCarItem(carModel: cars[index]));
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
    final cubit = context.read<BestCarCubit>();
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !cubit.isLoadingMore &&
        cubit.hasMore) {
      cubit.fetchBestCars(loadMore: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
