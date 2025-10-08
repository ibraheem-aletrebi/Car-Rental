import 'package:car_rental/core/resources/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarOverViewSection extends StatelessWidget {
  const CarOverViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BMW M4',
                            style: AppStyles.semiBold16.copyWith(
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            'A car with high specs that is rented at an affordable price.',
                            style: AppStyles.regular14.copyWith(
                              color: Colors.grey[600],
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// التقييم
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '4.9',
                              style: AppStyles.semiBold16.copyWith(
                                fontSize: 18.sp,
                              ),
                            ),
                            SizedBox(width: 5),
                            const Icon(
                              CupertinoIcons.star_fill,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ],
                        ),
                        Text(
                          '(100+Reviews)',
                          style: AppStyles.regular14.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
  }
}