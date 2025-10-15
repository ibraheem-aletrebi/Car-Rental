import 'package:bloc/bloc.dart';
import 'package:car_rental/domain/entities/user_entity.dart';
import 'package:car_rental/domain/repos/user_profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required UserProfileRepo userProfileRepo})
    : _repo = userProfileRepo,
      super(UserInitial());

  final UserProfileRepo _repo;
  UserProfileEntity? user;
  Future<void> fetchUserProfile() async {
    var result = await _repo.fetchUser();
    result.fold((failure) => emit(UserError(failure.errorMessage)), (user) {
      this.user = user;
      return emit(UserLoaded());
    });
  }
}
