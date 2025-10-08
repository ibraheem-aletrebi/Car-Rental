import 'package:car_rental/Feature/car_details/presentation/components/car_details_review_card.dart';
import 'package:flutter/cupertino.dart';

class CarDetailsReviewList extends StatelessWidget {
  const CarDetailsReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
             return CarDetailsReviewCard();
            },
          );
  }
}