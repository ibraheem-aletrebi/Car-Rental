class ColorModel {
  final int id;
  final String name;
  final String hexValue;
  ColorModel({required this.id, required this.name, required this.hexValue});
  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      id: json['id'],
      name: json['name'],
      hexValue: json['hex_value'],
    );
  }
}

