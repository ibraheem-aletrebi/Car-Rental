part of 'car_details_cubit.dart';

sealed class CarDetailsState extends Equatable {
  const CarDetailsState();

  @override
  List<Object> get props => [];
}

final class CarDetailsInitialState extends CarDetailsState {}

final class CarDetailsLoadedState extends CarDetailsState {
}

final class CarDetailsErrorState extends CarDetailsState {
  final String errorMessage;
  const CarDetailsErrorState(this.errorMessage);
}

final class CarDetailsLoadingState extends CarDetailsState {}
