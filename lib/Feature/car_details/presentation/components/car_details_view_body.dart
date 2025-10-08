import 'package:car_rental/Feature/car_details/presentation/components/car_images.dart';
import 'package:car_rental/Feature/home/presentation/components/user_image.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/widgets/custom_icon_button.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarDetailsViewBody extends StatelessWidget {
  const CarDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarImages(),
          HeightSpace(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                ),
                HeightSpace(),
                Divider(),
                HeightSpace(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          UserImage(),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ibraheem aleterbi',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.semiBold16.copyWith(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Row(
                                  children: [
                                    CustomIconButton(
                                      onPressed: () {},
                                      icon: FontAwesomeIcons.phone,
                                    ),
                                    WidthSpace(width: 8),
                                    CustomIconButton(
                                      onPressed: () {},
                                      icon: FontAwesomeIcons.message,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'Car Features',
                  style: AppStyles.semiBold16.copyWith(fontSize: 18.sp),
                ),
                HeightSpace(),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) => _infoTile(
                    CupertinoIcons.checkmark_seal,
                    'Transmission',
                    'Automatic',
                    context,
                  ),
                  itemCount: 12,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),

                HeightSpace(),
                ReviewWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(
    IconData icon,
    String title,
    String value,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.kPrimaryColor, size: 24),
          ),
          SizedBox(height: 4.h),
          Text(title, style: AppStyles.regular14.copyWith(fontSize: 12.sp)),
          Text(value, style: AppStyles.semiBold16.copyWith(fontSize: 14.sp)),
        ],
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reviews (100)',
              style: AppStyles.semiBold16.copyWith(fontSize: 18.sp),
            ),
            Text(
              'See All',
              style: AppStyles.regular14.copyWith(
                color: AppColors.kPrimaryColor,
              ),
            ),
          ],
        ),
        HeightSpace(),
        // Reviews List
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Container(
                  width: 220.w,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // user info
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.r,
                            backgroundColor: AppColors.kPrimaryColor
                                .withOpacity(0.1),
                            child: Text(
                              'i', // أول حرف من الاسم مثلاً
                              style: AppStyles.semiBold16.copyWith(
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ibraheem',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.semiBold16.copyWith(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '4.9',
                                      style: AppStyles.semiBold16.copyWith(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    const Icon(
                                      CupertinoIcons.star_fill,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Great experience! The car was clean and the process was easy.',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.regular14.copyWith(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '2 days ago',
                        style: AppStyles.regular14.copyWith(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
