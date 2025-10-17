import 'package:car_rental/data/models/location_model.dart';

abstract class LocationRepo {
  Future<List<LocationModel>> fetchLocations({ int page=1});
}
