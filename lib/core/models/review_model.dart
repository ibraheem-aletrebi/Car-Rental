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
      id: json['id'],
      username: json['username'],
      review: json['review'],
      rate: json['rate'],
    );
  }
}
