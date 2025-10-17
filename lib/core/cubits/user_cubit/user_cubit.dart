import 'package:bloc/bloc.dart';
import 'package:car_rental/core/cubits/user_cubit/user_state.dart';
import 'package:car_rental/domain/entities/user_entity.dart';
import 'package:car_rental/domain/repos/user_repo.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required UserRepo userProfileRepo})
    : _repo = userProfileRepo,
      super(UserInitial());
  final UserRepo _repo;
  UserProfileEntity? user;
  Future<void> fetchUserProfile() async {
    var result = await _repo.fetchUser();
    result.fold((failure) => emit(UserFailure(failure.errorMessage)), (user) {
      this.user = user;
      return emit(UserLoaded());
    });
  }
}
