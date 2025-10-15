
import 'package:car_rental/data/models/car_model.dart';

class PaginatedCarsModel {
  final List<CarModel> cars;
  final bool hasMore;
  PaginatedCarsModel({
    required this.cars,
    required this.hasMore,

  });
}