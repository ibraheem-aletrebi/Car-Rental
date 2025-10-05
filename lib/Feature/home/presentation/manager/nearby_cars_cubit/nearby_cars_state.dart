part of 'nearby_cars_cubit.dart';

sealed class NearbyCarsState extends Equatable {
  const NearbyCarsState();

  @override
  List<Object> get props => [];
}

final class NearbyCarsInitialState extends NearbyCarsState {}
final class NearbyCarsLoadingState extends NearbyCarsState {}
final class NearbyCarsLoadingMoreState extends NearbyCarsState {
  final List<CarModel> cars;
  const NearbyCarsLoadingMoreState({required this.cars});
}
final class NearbyCarsLoadedState extends NearbyCarsState {
  final List<CarModel> cars;
  final bool hasMore;
  const NearbyCarsLoadedState({required this.cars, required this.hasMore});
}


final class NearbyCarsErrorState extends NearbyCarsState {
  final String message;
  const NearbyCarsErrorState({required this.message});
}