import 'package:car_rental/Feature/home/presentation/components/car_image_header.dart';
import 'package:car_rental/Feature/search/presentation/components/recommended_car_info.dart';
import 'package:car_rental/core/entities/car_entity.dart';
import 'package:car_rental/core/entities/car_feature_entity.dart';
import 'package:car_rental/core/entities/review_entity.dart';

import 'package:car_rental/core/resources/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.kDarkWhite, width: 2),
      ),
      child: Column(
        children: [
          Expanded(
            child: CarImageHeader(
              imagePath:
                  'https://imgs.search.brave.com/0fMwmRiS2R6AdLpZWMxv3w9qa-jRWeWVjjGEMhjujGE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by90dW5lZC1zcG9y/dHMtcmFjaW5nLWNh/ci13aXRoLWFyY2gt/ZXh0ZW5zaW9ucy1h/aXItc3VzcGVuc2lv/bi1odWdlLXNwb2ls/ZXItM2QtcmVuZGVy/aW5nXzEwMTI2Ni0x/OTE2MS5qcGc_c2Vt/dD1haXNfaW5jb21p/bmcmdz03NDAmcT04/MA',
              isFavorite: false,
              onFavoritePressed: () {},
            ),
          ),
          Flexible(
            child: RecommendedCarInfo(
              carEntity: CarEntity(
                id: 101,
                name: 'Tesla Model S',
                description:
                    'The Tesla Model S is a premium electric sedan offering exceptional performance and range with advanced autonomous driving features.',
                firstImage:
                    'https://cdn.pixabay.com/photo/2019/09/25/09/43/tesla-4507700_1280.jpg',
                images: [
                  'https://cdn.pixabay.com/photo/2021/07/13/15/21/tesla-6462599_1280.jpg',
                  'https://cdn.pixabay.com/photo/2020/02/22/09/03/tesla-model-s-4868220_1280.jpg',
                  'https://cdn.pixabay.com/photo/2020/11/26/17/47/tesla-5780273_1280.jpg',
                ],
                carType: 'Electric',
                brandName: 'Tesla',
                colorName: 'Red',
                colorHex: '#FF0000',
                carFeatures: [
                  CarFeatureEntity(
                    id: 1,
                    name: 'Battery',
                    value: '100 kWh',
                    image:
                        'https://cdn-icons-png.flaticon.com/512/1048/1048310.png',
                  ),
                  CarFeatureEntity(
                    id: 2,
                    name: 'Range',
                    value: '652 km',
                    image:
                        'https://cdn-icons-png.flaticon.com/512/684/684908.png',
                  ),
                  CarFeatureEntity(
                    id: 3,
                    name: 'Acceleration',
                    value: '0-100 km/h in 3.1s',
                    image:
                        'https://cdn-icons-png.flaticon.com/512/3039/3039436.png',
                  ),
                ],
                seatingCapacity: '5 Seats',
                locationName: 'Zamalek, Cairo',
                averageRate: 4.9,
                isForRent: true,
                dailyRent: 120.0,
                availableToBook: true,
                reviews: [
                  ReviewEntity(
                    id: 1,
                    username: 'Ahmed Nabil',
                    review: 'Amazing car! Super quiet and fast ⚡',
                    userImage:
                        'https://cdn-icons-png.flaticon.com/512/194/194938.png',
                    rate: 5,
                  ),
                  ReviewEntity(
                    id: 2,
                    username: 'Sara Mostafa',
                    review: 'Comfortable and futuristic interior.',
                    userImage:
                        'https://cdn-icons-png.flaticon.com/512/2922/2922510.png',
                    rate: 4,
                  ),
                ],
                reviewsCount: 2,
                reviewsAvg: 4.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
