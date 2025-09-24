part of 'brands_cubit.dart';

sealed class BrandsState extends Equatable {
  const BrandsState();

  @override
  List<Object> get props => [];
}

final class BrandsInitialState extends BrandsState {}

final class BrandsLoadingState extends BrandsState {}
final class BrandsLoadedState extends BrandsState {
  final List<BrandModel> brands;
 const BrandsLoadedState(this.brands);
}

final class BrandsErrorState extends BrandsState {
  final String message;
  const BrandsErrorState(this.message);
}