import 'package:car_rental/Feature/auth/data/repo/auth_repo_imp.dart';
import 'package:car_rental/Feature/auth/data/repo/location_repo_imp.dart';
import 'package:car_rental/Feature/auth/data/repo/password_repo_imp.dart';
import 'package:car_rental/Feature/auth/data/repo/phone_verify_repo_imp.dart';
import 'package:car_rental/Feature/auth/data/repo/sign_up_repo_imp.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/Feature/auth/domain/repo/location_repo.dart';
import 'package:car_rental/Feature/auth/domain/repo/password_repo.dart';
import 'package:car_rental/Feature/auth/domain/repo/phone_verify_repo.dart';
import 'package:car_rental/Feature/auth/domain/repo/sign_up_repo.dart';
import 'package:car_rental/Feature/car_details/data/repo/car_details_repo_imp.dart';
import 'package:car_rental/Feature/car_details/domain/repo/car_details_repo.dart';
import 'package:car_rental/Feature/home/data/repos/home_repo_imp.dart';
import 'package:car_rental/Feature/home/domain/repos/home_repo.dart';
import 'package:car_rental/core/services/local_services/preference_manager.dart';
import 'package:car_rental/core/services/local_services/secure_storage_services.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  await _initCore();
  _initApiService();
  _initAuth();
  _initHome();
  _initCarDetails();
}

Future<void> _initCore() async {
  await PreferenceManager().init();
  getIt.registerSingleton<SecureStorageService>(SecureStorageService());
}

void _initApiService() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(dio: getIt<Dio>()));
}

void _initAuth() {
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      apiService: getIt<ApiService>(),
      secureStorageService: getIt<SecureStorageService>(),
    ),
  );

  getIt.registerSingleton<PhoneVerifyRepo>(
    PhoneVerifyRepoImpl(
      apiService: getIt<ApiService>(),
      secureStorageService: getIt<SecureStorageService>(),
    ),
  );

  getIt.registerSingleton<PasswordRepo>(
    PasswordRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImp(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<LocationRepo>(
    () => LocationRepoImp(apiService: getIt<ApiService>()),
  );
}

void _initHome() {
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImp(apiService: getIt<ApiService>()),
  );
}

void _initCarDetails() {
  getIt.registerLazySingleton<CarDetailsRepo>(
    () => CarDetailsRepoImp(apiService: getIt<ApiService>()),
  );
}
