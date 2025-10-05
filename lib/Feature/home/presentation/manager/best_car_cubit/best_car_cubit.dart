import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/home/domain/repos/home_repo.dart';
import 'package:car_rental/core/models/car_model.dart';
import 'package:equatable/equatable.dart';

part 'best_car_state.dart';

class BestCarCubit extends Cubit<BestCarState> {
  BestCarCubit({required this.homeRepo}) : super(BestCarInitialState());
  final HomeRepo homeRepo;

  List<CarModel> cars = [];
  int page = 1;
  bool isLoadingMore = false;
  bool hasMore = true;

  void fetchBestCars({bool loadMore = false}) async {
    if (isLoadingMore || !hasMore) return;

    if (loadMore) {
      page++;
      isLoadingMore = true;
      emit(BestCarLoadingMoreState(cars));
    } else {
      emit(BestCarLoadingState());
      page = 1;
      cars = [];
      hasMore = true;
    }

    var result = await homeRepo.fetchBestCars(page: page);
    result.fold(
      (failure) {
        emit(BestCarErrorState(failure.errorMessage));
      },
      (paginatedCars) {
        cars.addAll(paginatedCars.cars);
        hasMore = paginatedCars.hasMore;
        emit(BestCarSuccessState(cars, hasMore));
      },
    );

    isLoadingMore = false;
  }
}
