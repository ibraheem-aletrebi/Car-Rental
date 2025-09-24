part of 'best_car_cubit.dart';

sealed class BestCarState extends Equatable {
  const BestCarState();

  @override
  List<Object> get props => [];
}

final class BestCarInitialState extends BestCarState {}
final class BestCarLoadingState extends BestCarState {}
final class BestCarSuccessState extends BestCarState {
  final List<CarModel> cars;  
  const BestCarSuccessState(this.cars);
}
final class BestCarErrorState extends BestCarState {
  final String errorMessage;
  const BestCarErrorState(this.errorMessage);
} 
