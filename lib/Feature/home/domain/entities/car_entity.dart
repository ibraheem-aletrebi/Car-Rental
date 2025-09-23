class CarEntity {
  final String name;
  final String imagePath;
  final double rating;
  final String location;
  final int seats;
  final double pricePerDay;
  final bool isFavorite;

  const CarEntity({
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.location,
    required this.seats,
    required this.pricePerDay,
    this.isFavorite = false,
  });
}


// class CarEntity {
//   final int id;
//   final String name;
//   final String image;
//   final String description;
//   final BrandEntity brand;
//   final ColorEntity color;
//   final List<CarFeatureEntity> features;
//   final LocationEntity location;
//   final double averageRate;
//   final bool isForRent;
//   final double? dailyRent;
//   final double? weeklyRent;
//   final double? monthlyRent;
//   final double? yearlyRent;
//   final bool isForPay;
//   final double? price;
//   final bool availableToBook;
//   final List<ReviewEntity> reviews;

//   const CarEntity({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.description,
//     required this.brand,
//     required this.color,
//     required this.features,
//     required this.location,
//     required this.averageRate,
//     required this.isForRent,
//     this.dailyRent,
//     this.weeklyRent,
//     this.monthlyRent,
//     this.yearlyRent,
//     required this.isForPay,
//     this.price,
//     required this.availableToBook,
//     required this.reviews,
//   });
// }





class LocationEntity {
  final int id;
  final String name;
  final double lat;
  final double lng;

  const LocationEntity({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
  });
}
