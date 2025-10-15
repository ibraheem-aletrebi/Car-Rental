import 'package:car_rental/data/models/brand_model.dart';
import 'package:car_rental/data/models/car_feature_model.dart';
import 'package:car_rental/data/models/color_model.dart';
import 'package:car_rental/data/models/location_model.dart';
import 'package:car_rental/data/models/review_model.dart';
import 'package:flutter/material.dart';

import 'package:car_rental/Feature/home/presentation/components/car_image_header.dart';
import 'package:car_rental/Feature/home/presentation/components/car_info_section.dart';
import 'package:car_rental/data/models/car_model.dart';
import 'package:car_rental/core/resources/app_colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

var car = CarModel(
  id: 2,
  name: "BMW i8",
  description: "A stylish BMW i8 available for rent or purchase.",
  firstImage:
      "http://qent.up.railway.app/media/cars/bmw/bmw-i8/BMW_4srNDND.png",
  images: [
    "http://qent.up.railway.app/media/cars/bmw/bmw-i8/BMW_4srNDND.png",
    "http://qent.up.railway.app/media/cars/bmw/bmw-i8/extra_0_BMW_cYNR4Se.png",
    "http://qent.up.railway.app/media/cars/bmw/bmw-i8/extra_1_BMW_GNS4Ssa.png",
  ],
  carType: "Regular",
  brand: BrandModel(
    id: 1,
    name: "BMW",
    image: "http://qent.up.railway.app/media/brands/BMW_AXZnPqd.png",
  ),
  color: ColorModel(id: 2, name: "Blue", hexValue: "#0000FF"),
  carFeatures: [
    CarFeatureModel(
      id: 4,
      name: "GPS",
      value: "Available",
      image: "http://qent.up.railway.app/media/icons/gps.png",
    ),
    CarFeatureModel(
      id: 5,
      name: "Bluetooth",
      value: "Available",
      image: "http://qent.up.railway.app/media/icons/bluetooth.png",
    ),
    CarFeatureModel(
      id: 7,
      name: "Fuel Type",
      value: "Diesel",
      image: "http://qent.up.railway.app/media/icons/fuel.png",
    ),
  ],
  seatingCapacity: "4 Seats",
  location: LocationModel(
    id: 5,
    name: "Mohandessin, Giza",
    lat: 30.0617,
    lng: 31.2161,
  ),
  averageRate: 5,
  isForRent: true,
  isForPay: true,
  availableToBook: false,
  reviews: [
    ReviewModel(
      id: 2,
      username: "0xCode",
      review: "Smooth ride and reliable.",
      userImage: "http://qent.up.railway.app/media/default/profile/profile.jpg",
      rate: 3,
    ),
  ],
  reviewsCount: 1,
  reviewsAvg: 3.0,
  price: 5000,
  dailyRent: 100000,
);

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.carModel});
  final CarModel carModel;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 186.w / 237.h,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.kStokeColor, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CarImageHeader(
                imagePath: carModel.firstImage,
                isFavorite: false,
                onFavoritePressed: () {},
              ),
            ),
            Expanded(child: CarInfoSection(carModel: carModel)),
          ],
        ),
      ),
    );
  }
}
