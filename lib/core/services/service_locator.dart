import 'package:car_rental/Feature/auth/data/repo/auth_repo_imp.dart';
import 'package:car_rental/Feature/auth/domain/repo/auth_repo.dart';
import 'package:car_rental/core/services/local_services/secure_storage_services.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton(ApiService(dio: getIt<Dio>()));
  getIt.registerSingleton<SecureStorageService>(SecureStorageService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      apiService: getIt<ApiService>(),
      secureStorageService: getIt<SecureStorageService>(),
    ),
  );
}
