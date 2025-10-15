import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/car_details/domain/repo/car_details_repo.dart';
import 'package:car_rental/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

part 'car_reviewes_state.dart';

class CarReviewesCubit extends Cubit<CarReviewesState> {
  CarReviewesCubit({
    required CarDetailsRepo carDetailsRepo
  })
    : _repo = carDetailsRepo,
      super(CarReviewesInitial());

  final CarDetailsRepo _repo;

  Future<void> fetchCarReviews({required int carId}) async {
    emit(CarReviewesLoading());
    final result = await _repo.getCarReviews(carId: carId);
    result.fold(
      (failure) => emit(CarReviewesFailure(message: failure.errorMessage)),
      (reviews) => emit(CarReviewesLoaded(reviews: reviews)),
    );
  }
}
