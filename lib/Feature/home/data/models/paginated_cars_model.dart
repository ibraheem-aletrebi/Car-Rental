
import 'package:car_rental/core/models/car_model.dart';

class PaginatedCarsModel {
  final List<CarModel> cars;
  final bool hasMore;
  PaginatedCarsModel({
    required this.cars,
    required this.hasMore,

  });
}