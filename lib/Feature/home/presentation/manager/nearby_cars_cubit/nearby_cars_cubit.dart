import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/home/domain/repos/home_repo.dart';
import 'package:car_rental/data/models/car_model.dart';
import 'package:equatable/equatable.dart';

part 'nearby_cars_state.dart';

class NearbyCarsCubit extends Cubit<NearbyCarsState> {
  NearbyCarsCubit({required this.homeRepo}) : super(NearbyCarsInitialState());

  final HomeRepo homeRepo;
  List<CarModel> cars = [];
  int page = 1;
  bool isLoadingMore = false;
  bool hasMore = true;

  void fetchNearbyCars({bool loadMore = false}) async {
    if (isLoadingMore || !hasMore) return;

    if (loadMore) {
      page++;
      isLoadingMore = true;
      emit(NearbyCarsLoadingMoreState(cars: cars));
    } else {
      emit(NearbyCarsLoadingState());
      page = 1;
      cars = [];
      hasMore = true;
    }

    var result = await homeRepo.fetchNearbyCars(page: page); 
    result.fold(
      (failure) {
        emit(NearbyCarsErrorState(message: failure.errorMessage));
      },
      (paginatedCarsModel) {
        cars.addAll(paginatedCarsModel.cars);
        hasMore = paginatedCarsModel.hasMore;
        emit(
          NearbyCarsLoadedState(
            cars: cars,        
            hasMore: hasMore,
          ),
        );
      },
    );

    isLoadingMore = false;
  }
}
