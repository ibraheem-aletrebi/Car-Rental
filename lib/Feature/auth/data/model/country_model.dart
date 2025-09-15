class CountryModel {
  final int id;
  final String country;
  final String abbreviation;

  CountryModel({
    required this.id,
    required this.country,
    required this.abbreviation,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] as int,
      country: json['country'] as String,
      abbreviation: json['abbreviation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'country': country, 'abbreviation': abbreviation};
  }

  @override
  String toString() => '$country ($abbreviation)';
}
