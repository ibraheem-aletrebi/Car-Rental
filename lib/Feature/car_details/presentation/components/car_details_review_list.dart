import 'package:car_rental/Feature/car_details/presentation/components/car_details_review_card.dart';
import 'package:car_rental/core/entities/review_entity.dart';
import 'package:flutter/cupertino.dart';


class CarDetailsReviewList extends StatelessWidget {
  const CarDetailsReviewList({super.key, required this.reviews});
  final List<ReviewEntity> reviews ;
  @override
  Widget build(BuildContext context) {
  
    return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reviews.length>3?3:reviews.length,
            itemBuilder: (context, index) {
             return CarDetailsReviewCard(review: reviews[index],);
            },
          );
  }
}