import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Config/appConfig.dart';
import '../Theme/colors.dart';
import '../Utils/dimensions.dart';
import '../Utils/fontStyles.dart';

class IconWithText extends StatelessWidget {
  String? imageUrl;
  String? txt;
  IconWithText({super.key, this.txt, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: kFFFFFF,
          borderRadius: BorderRadius.circular(
            Dimensions.RADIUS_DEFAULT,
          )),
      child: Row(
        children: [
          SvgPicture.asset(
            '$imgUrl$imageUrl',
            height: 20.h,
            width: 20.w,
            color: secDarkGreyIconColor,
          ),
          size5w,
          customText(
            text: '$txt',
            textStyle: bold14NavyBlue,
          ),
        ],
      ),
    );
  }
}
