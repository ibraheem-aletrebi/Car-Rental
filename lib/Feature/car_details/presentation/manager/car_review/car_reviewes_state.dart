part of 'car_reviewes_cubit.dart';

sealed class CarReviewesState extends Equatable {
  const CarReviewesState();

  @override
  List<Object> get props => [];
}

final class CarReviewesInitial extends CarReviewesState {}
final class CarReviewesLoading extends CarReviewesState {}
final class CarReviewesLoaded extends CarReviewesState {
  const CarReviewesLoaded({required this.reviews});
  final List<ReviewEntity> reviews;    
}
final class CarReviewesFailure extends CarReviewesState {
  const CarReviewesFailure({required this.message});
  final String message;
}

