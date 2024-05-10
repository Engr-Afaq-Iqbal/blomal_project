import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme/colors.dart';
import '../Utils/dimensions.dart';
import '../Utils/fontStyles.dart';

class TitleWithTextGradient extends StatelessWidget {
  String? title;
  String? txt;
  TitleWithTextGradient({super.key, this.txt, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              kDBE9F3,
              kBCC8FF,
            ],
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.RADIUS_DEFAULT,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text: '$title',
            textStyle: regular14NavyBlue,
          ),
          size5h,
          customText(
            text: '$txt',
            textStyle: bold14Blue,
          ),
        ],
      ),
    );
  }
}
