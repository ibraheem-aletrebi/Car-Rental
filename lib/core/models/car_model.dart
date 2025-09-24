import 'package:car_rental/core/models/brand_model.dart';
import 'package:car_rental/core/models/car_feature_model.dart';
import 'package:car_rental/core/models/color_model.dart';
import 'package:car_rental/core/models/location_model.dart';
import 'package:car_rental/core/models/review_model.dart';

class CarModel {
  final int id;
  final String name;
  final String image;
  final String description;
  final String carType;
  final BrandModel brand;
  final ColorModel color;
  final List<CarFeatureModel> features;
  final int seatingCapacity;
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
  CarModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.carType,
    required this.brand,
    required this.color,
    required this.features,
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
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      carType: json['car_type'],
      brand: BrandModel.fromJson(json['brand']),
      color: ColorModel.fromJson(json['color']),
      features:
          (json['features'] as List?)
              ?.map((x) => CarFeatureModel.fromJson(x))
              .toList() ??
          [],
      seatingCapacity: json['seating_capacity'],
      location: LocationModel.fromJson(json['location']),
      averageRate: json['average_rate'],
      isForRent: json['is_for_rent'],
      dailyRent: json['daily_rent'],
      weeklyRent: json['weekly_rent'],
      monthlyRent: json['monthly_rent'],
      yearlyRent: json['yearly_rent'],
      isForPay: json['is_for_pay'],
      price: json['price'],
      availableToBook: json['available_to_book'],
      reviews: List<ReviewModel>.from(
        json['reviews'].map((x) => ReviewModel.fromJson(x)).toList(),
      ),
    );
  }
}
