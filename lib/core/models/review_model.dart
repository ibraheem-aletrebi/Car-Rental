class ReviewModel {
  final int id;
  final String username;
  final String review;
  final int rate;

  ReviewModel({
    required this.id,
    required this.username,
    required this.review,
    required this.rate,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? 0,
      username: json['username']?.toString() ?? '',
      review: json['review']?.toString() ?? '',
      rate: int.tryParse(json['rate']?.toString() ?? '') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username, 'review': review, 'rate': rate};
  }
}
