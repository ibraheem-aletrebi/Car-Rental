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
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? '',
      value: json['value']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'value': value, 'image': image};
  }
}
