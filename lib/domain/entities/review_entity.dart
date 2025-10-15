class ReviewEntity {
  final int id;
  final String username;
  final String review;
  final String userImage;
  final int rate;

  const ReviewEntity({
    required this.id,
    required this.username,
    required this.review,
    required this.userImage,
    required this.rate,
  });
}