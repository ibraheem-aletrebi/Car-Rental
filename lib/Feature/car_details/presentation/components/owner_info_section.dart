import 'package:car_rental/Feature/home/presentation/components/user_image.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/widgets/custom_icon_button.dart';
import 'package:car_rental/core/widgets/width_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OwnerInfoSection extends StatelessWidget {
  const OwnerInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                      style: AppStyles.semiBold16.copyWith(fontSize: 14.sp),
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
    );
  }
}
