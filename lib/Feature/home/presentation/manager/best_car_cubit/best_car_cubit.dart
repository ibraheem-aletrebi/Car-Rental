import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/home/domain/repos/home_repo.dart';
import 'package:car_rental/core/models/car_model.dart';
import 'package:equatable/equatable.dart';

part 'best_car_state.dart';

class BestCarCubit extends Cubit<BestCarState> {
  BestCarCubit({required this.homeRepo}) : super(BestCarInitialState());
  final HomeRepo homeRepo;

  void fetchBestCars() async {
    emit(BestCarLoadingState());
    var result = await homeRepo.fetchBestCars();
    result.fold(
      (failure) {
        emit(BestCarErrorState(failure.errorMessage));
      },
      (cars) {
        emit(BestCarSuccessState(cars));
      },
    );
  }
}
