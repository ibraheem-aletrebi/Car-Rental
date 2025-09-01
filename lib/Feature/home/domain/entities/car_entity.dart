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