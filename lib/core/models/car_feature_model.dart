import 'package:car_rental/core/entities/car_feature_entity.dart';

class CarFeatureModel extends CarFeatureEntity {
  CarFeatureModel({
    required super.id,
    required super.name,
    required super.value,
    required super.image,
  });

  factory CarFeatureModel.fromJson(Map<String, dynamic> json) {
    return CarFeatureModel(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? '',
      value: json['value']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'image': image,
    };
  }

  CarFeatureEntity toEntity() {
    return CarFeatureEntity(
      id: id,
      name: name,
      value: value,
      image: image,
    );
  }
}
