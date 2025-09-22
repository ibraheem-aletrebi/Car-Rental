import 'package:car_rental/Feature/auth/data/model/location_response_model.dart';

abstract class LocationRepo {
  Future<List<LocationResponseModel>> fetchLocations({ int page=1});
}
