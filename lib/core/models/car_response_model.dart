import 'package:car_rental/core/models/car_model.dart';
import 'package:car_rental/core/models/pagination_model.dart';

class CarResponseModel {
  final List<CarModel> data;
  final Links links;
  final Meta meta;

  CarResponseModel({required this.data, required this.links, required this.meta});

  factory CarResponseModel.fromJson(Map<String, dynamic> json) {
    return CarResponseModel(
      data: (json['data'] as List).map((e) => CarModel.fromJson(e)).toList(),
      links: Links.fromJson(json['links']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}










