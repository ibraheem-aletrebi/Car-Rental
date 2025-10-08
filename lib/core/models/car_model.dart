import 'package:car_rental/core/models/brand_model.dart';
import 'package:car_rental/core/models/car_feature_model.dart';
import 'package:car_rental/core/models/color_model.dart';
import 'package:car_rental/core/models/location_model.dart';
import 'package:car_rental/core/models/review_model.dart';

class CarModel {
  final int id;
  final String name;
  final String description;
  final String firstImage;
  final List<String> images;
  final String carType;
  final BrandModel brand;
  final ColorModel color;
  final List<CarFeatureModel> carFeatures;
  final String seatingCapacity;
  final LocationModel location;
  final int averageRate;
  final bool isForRent;
  final double? dailyRent;
  final double? weeklyRent;
  final double? monthlyRent;
  final double? yearlyRent;
  final bool isForPay;
  final double? price;
  final bool availableToBook;
  final List<ReviewModel> reviews;
  final int reviewsCount;
  final double reviewsAvg;

  CarModel({
    required this.id,
    required this.name,
    required this.description,
    required this.firstImage,
    required this.images,
    required this.carType,
    required this.brand,
    required this.color,
    required this.carFeatures,
    required this.seatingCapacity,
    required this.location,
    required this.averageRate,
    required this.isForRent,
    this.dailyRent,
    this.weeklyRent,
    this.monthlyRent,
    this.yearlyRent,
    required this.isForPay,
    this.price,
    required this.availableToBook,
    required this.reviews,
    required this.reviewsCount,
    required this.reviewsAvg,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      firstImage: json['first_image'] ?? '',
      images: (json['images'] as List?)
              ?.map((x) => x['image']?.toString() ?? '')
              .toList() ??
          [],
      carType: json['car_type'] ?? '',
      brand: BrandModel.fromJson(json['brand']),
      color: ColorModel.fromJson(json['color']),
      carFeatures: (json['car_features'] as List?)
              ?.map((x) => CarFeatureModel.fromJson(x))
              .toList() ??
          [],
      seatingCapacity: json['seating_capacity']?.toString() ?? '',
      location: LocationModel.fromJson(json['location']),
      averageRate: json['average_rate'] ?? 0,
      isForRent: json['is_for_rent'] ?? false,
      dailyRent: double.tryParse(json['daily_rent']?.toString() ?? ''),
      weeklyRent: double.tryParse(json['weekly_rent']?.toString() ?? ''),
      monthlyRent: double.tryParse(json['monthly_rent']?.toString() ?? ''),
      yearlyRent: double.tryParse(json['yearly_rent']?.toString() ?? ''),
      isForPay: json['is_for_pay'] ?? false,
      price: json['price'] == null
          ? null
          : double.tryParse(json['price'].toString()),
      availableToBook: json['available_to_book'] ?? false,
      reviews: (json['reviews'] as List?)
              ?.map((x) => ReviewModel.fromJson(x))
              .toList() ??
          [],
      reviewsCount: json['reviews_count'] ?? 0,
      reviewsAvg: double.tryParse(json['reviews_avg']?.toString() ?? '0.0') ?? 0.0,
    );
  }
}
