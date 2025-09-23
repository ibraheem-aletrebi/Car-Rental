class CarFeatureModel {
  final int id;
  final String name;
  final String value;
  final String image;

  CarFeatureModel({
    required this.id,
    required this.name,
    required this.value,
    required this.image,
  });

  factory CarFeatureModel.fromJson(Map<String, dynamic> json) {
    return CarFeatureModel(
      id: json['id'],
      name: json['name'],
      value: json['value'],
      image: json['image'],
    );
  }
}