import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/car_details/domain/repo/car_details_repo.dart';
import 'package:car_rental/domain/entities/car_entity.dart';
import 'package:equatable/equatable.dart';

part 'car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState> {
  CarDetailsCubit(this.repo) : super(CarDetailsInitialState());

  final CarDetailsRepo repo;

   CarEntity? car;

  Future<void> getCarDetails(int id) async {
    emit(CarDetailsLoadingState());

    final result = await repo.getCarDetails(id: id);

    result.fold(
      (failure) {
        emit(CarDetailsErrorState(failure.errorMessage));
      },
      (car) {
        this.car = car;
        emit(CarDetailsLoadedState());
      },
    );
  }
}
