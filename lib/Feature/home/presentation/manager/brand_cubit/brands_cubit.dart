import 'package:bloc/bloc.dart';
import 'package:car_rental/Feature/home/domain/repos/home_repo.dart';
import 'package:car_rental/data/models/brand_model.dart';
import 'package:equatable/equatable.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit({required this.homeRepo}) : super(BrandsInitialState());

  final HomeRepo homeRepo;

  void fetchBrands() async {
    emit(BrandsLoadingState());
    var result = await homeRepo.fetchBrands();
    result.fold(
      (failure) {
        emit(BrandsErrorState(failure.errorMessage));
      },
      (brands) {
        emit(BrandsLoadedState(brands));
      },
    );
  }
}
