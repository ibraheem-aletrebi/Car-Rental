part of 'nearby_cars_cubit.dart';

sealed class NearbyCarsState extends Equatable {
  const NearbyCarsState();

  @override
  List<Object> get props => [];
}

final class NearbyCarsInitialState extends NearbyCarsState {}
final class NearbyCarsLoadingState extends NearbyCarsState {}
final class NearbyCarsLoadedState extends NearbyCarsState {
  final List<CarModel> cars;
  const NearbyCarsLoadedState({required this.cars});
}


final class NearbyCarsErrorState extends NearbyCarsState {
  final String message;
  const NearbyCarsErrorState({required this.message});
}