part of 'best_car_cubit.dart';

sealed class BestCarState extends Equatable {
  const BestCarState();

  @override
  List<Object> get props => [];
}

final class BestCarInitialState extends BestCarState {}
final class BestCarLoadingState extends BestCarState {}

final class BestCarLoadingMoreState extends BestCarState {
  final List<CarModel> cars;
  const BestCarLoadingMoreState(this.cars);
}
final class BestCarSuccessState extends BestCarState {
  final List<CarModel> cars; 
  final bool hasMore; 
  const BestCarSuccessState(this.cars, this.hasMore);
}
final class BestCarErrorState extends BestCarState {
  final String errorMessage;
  const BestCarErrorState(this.errorMessage);
} 
