import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/home/domain/repos/home_repo.dart';
import 'package:car_rental/core/models/car_model.dart';
import 'package:equatable/equatable.dart';

part 'nearby_cars_state.dart';

class NearbyCarsCubit extends Cubit<NearbyCarsState> {
  NearbyCarsCubit({required this.homeRepo}) : super(NearbyCarsInitialState());

  final HomeRepo homeRepo;

  void fetchNearbyCars() async {
    emit(NearbyCarsLoadingState());
    var result = await homeRepo.fetchNearbyCars();
    result.fold(
      (failure) {
        emit(NearbyCarsErrorState(message: failure.errorMessage));
      },
      (cars) {
        emit(NearbyCarsLoadedState(cars: cars));
      },
    );
  }
}
