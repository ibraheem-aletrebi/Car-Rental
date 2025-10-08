class ColorModel {
  final int id;
  final String name;
  final String hexValue;

  ColorModel({
    required this.id,
    required this.name,
    required this.hexValue,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? '',
      hexValue: json['hex_value']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'hex_value': hexValue,
    };
  }
}
