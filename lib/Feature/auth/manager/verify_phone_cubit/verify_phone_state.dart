part of 'verify_phone_cubit.dart';

@immutable
abstract class VerifyPhoneState {}

class VerifyPhoneInitial extends VerifyPhoneState {}

class VerifyPhoneLoading extends VerifyPhoneState {}

class VerifyPhoneCodeSent extends VerifyPhoneState {
  final VerifyPhoneResponseModel verifyPhoneResponseModel;
  VerifyPhoneCodeSent({required this.verifyPhoneResponseModel});
}

class VerifyPhoneVerified extends VerifyPhoneState {
  
}



class VerifyPhoneError extends VerifyPhoneState {
  final String message;
  VerifyPhoneError(this.message);
}
