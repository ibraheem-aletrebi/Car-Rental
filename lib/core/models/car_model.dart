import 'package:car_rental/core/models/brand_model.dart';
import 'package:car_rental/core/models/car_feature_model.dart';
import 'package:car_rental/core/models/color_model.dart';
import 'package:car_rental/core/models/loction_model.dart';
import 'package:car_rental/core/models/review_model.dart';

class CarModel {
  final int id;
  final String name;
  final String image;
  final String description;
  final BrandModel brand;
  final ColorModel color;
  final List<CarFeatureModel> carFeatures;
  final LocationModel location;
  final double averageRate;
  final bool isForRent;
  final double? dailyRent;
  final double? weeklyRent;
  final double? monthlyRent;
  final double? yearlyRent;
  final bool isForPay;
  final double? price;
  final bool availableToBook;
  final List<ReviewModel> reviews;

  CarModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.brand,
    required this.color,
    required this.carFeatures,
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
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      brand: BrandModel.fromJson(json['brand']),
      color: ColorModel.fromJson(json['color']),
      carFeatures: (json['car_features'] as List)
          .map((e) => CarFeatureModel.fromJson(e))
          .toList(),
      location: LocationModel.fromJson(json['location']),
      averageRate: (json['average_rate'] ?? 0).toDouble(),
      isForRent: json['is_for_rent'],
      dailyRent: (json['daily_rent'] != null)
          ? (json['daily_rent'] as num).toDouble()
          : null,
      weeklyRent: (json['weekly_rent'] != null)
          ? (json['weekly_rent'] as num).toDouble()
          : null,
      monthlyRent: (json['monthly_rent'] != null)
          ? (json['monthly_rent'] as num).toDouble()
          : null,
      yearlyRent: (json['yearly_rent'] != null)
          ? (json['yearly_rent'] as num).toDouble()
          : null,
      isForPay: json['is_for_pay'],
      price: (json['price'] != null) ? (json['price'] as num).toDouble() : null,
      availableToBook: json['available_to_book'],
      reviews: (json['reviews'] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
    );
  }


  //   CarEntity toEntity() {
  //   return CarEntity(
  //     id: id,
  //     name: name,
  //     image: image,
  //     description: description,
  //     brand: brand.toEntity(),
  //     color: color.toEntity(),
  //     features: features.map((f) => f.toEntity()).toList(),
  //     location: location.toEntity(),
  //     averageRate: averageRate,
  //     isForRent: isForRent,
  //     dailyRent: dailyRent,
  //     weeklyRent: weeklyRent,
  //     monthlyRent: monthlyRent,
  //     yearlyRent: yearlyRent,
  //     isForPay: isForPay,
  //     price: price,
  //     availableToBook: availableToBook,
  //     reviews: reviews.map((r) => r.toEntity()).toList(),
  //   );
  // }
}
