import 'package:car_rental/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.id,
    required super.username,
    required super.review,
    required super.rate,
    required super.userImage,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? 0,
      username: json['username']?.toString() ?? '',
      review: json['review']?.toString() ?? '',
      rate: json['rate'] is int
          ? json['rate']
          : int.tryParse(json['rate']?.toString() ?? '') ?? 0,
      userImage: json['user_image']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'review': review,
      'rate': rate,
      'user_image': userImage,
    };
  }

  
  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      username: username,
      review: review,
      userImage: userImage,
      rate: rate,
    );
  }
}
