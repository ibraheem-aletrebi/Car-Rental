class CountryModel {
  final int countryCode;
  final String countryName;
  final String imageUrl;
  CountryModel({
    required this.countryCode,
    required this.countryName,
    required this.imageUrl,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      countryCode: json['countryCode'],
      countryName: json['countryName'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'countryCode': countryCode,
      'countryName': countryName,
      'imageUrl': imageUrl,
    };
  }
}
