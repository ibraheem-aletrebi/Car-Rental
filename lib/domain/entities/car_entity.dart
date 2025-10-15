import 'package:car_rental/domain/entities/car_feature_entity.dart';
import 'package:equatable/equatable.dart';
import 'review_entity.dart';


class CarEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String firstImage;
  final List<String> images;
  final String carType;
  final String brandName;
  final String colorName;
  final String colorHex;
  final List<CarFeatureEntity> carFeatures;
  final String seatingCapacity;
  final String locationName;
  final double? averageRate;
  final bool isForRent;
  final double? dailyRent;
  final bool availableToBook;
  final List<ReviewEntity> reviews;
  final int reviewsCount;
  final double reviewsAvg;

  const CarEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.firstImage,
    required this.images,
    required this.carType,
    required this.brandName,
    required this.colorName,
    required this.colorHex,
    required this.carFeatures,
    required this.seatingCapacity,
    required this.locationName,
    required this.averageRate,
    required this.isForRent,
    required this.dailyRent,
    required this.availableToBook,
    required this.reviews,
    required this.reviewsCount,
    required this.reviewsAvg,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        firstImage,
        images,
        carType,
        brandName,
        colorName,
        colorHex,
        carFeatures,
        seatingCapacity,
        locationName,
        averageRate,
        isForRent,
        dailyRent,
        availableToBook,
        reviews,
        reviewsCount,
        reviewsAvg,
      ];
}
