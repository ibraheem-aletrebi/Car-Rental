import 'dart:developer';
import 'package:car_rental/Feature/auth/domain/repo/location_repo.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:car_rental/core/services/network_services/back_end_end_point.dart';
import 'package:car_rental/data/models/location_model.dart';

class LocationRepoImp implements LocationRepo {
  final ApiService apiService;

  LocationRepoImp({required this.apiService});
  @override
  Future<List<LocationModel>> fetchLocations({int page = 1}) async {
    try {
      var response = await apiService.get(
        endPoint: BackEndEndPoint.locationEndPoint,
      );
      var data = response['data'];
      List<LocationModel> result = [];
      for (var e in data) {
        result.add(LocationModel.fromJson(e));
      }
      return result;
          
    } catch (e) {
      log('error: ${e.toString()} From -> location repo imp get location');
      throw Exception(e.toString());
    }
  }
}
