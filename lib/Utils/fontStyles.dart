import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme/colors.dart';

String fontIBMRegular = 'IBMPlexSansRegular';
String fontIBMBold = 'IBMPlexSansBold';
String fontFamily = 'IBMPlexSans';

Text customText({
  required String text,
  TextStyle? textStyle,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: textStyle,
  );
}

final TextStyle regular16PrimaryBlue = TextStyle(
  fontSize: 16.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.normal,
  color: primaryBlueColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle regular14PrimaryBlue = TextStyle(
  fontSize: 14.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.normal,
  color: primaryBlueColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle regular12PrimaryBlue = TextStyle(
  fontSize: 12.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.normal,
  color: primaryBlueColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle regular16NavyBlue = TextStyle(
  fontSize: 16.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.normal,
  color: secDarkBlueNavyColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle regular14NavyBlue = TextStyle(
  fontSize: 14.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.normal,
  color: secDarkBlueNavyColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle regular12NavyBlue = TextStyle(
  fontSize: 12.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.normal,
  color: secDarkBlueNavyColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle bold12NavyBlue = TextStyle(
  fontSize: 12.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: secDarkBlueNavyColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle bold14NavyBlue = TextStyle(
  fontSize: 14.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: secDarkBlueNavyColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle bold16White = TextStyle(
  fontSize: 16.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: kWhite,
  overflow: TextOverflow.ellipsis,
);

final TextStyle bold12White = TextStyle(
  fontSize: 16.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: kWhite,
  overflow: TextOverflow.ellipsis,
);

final TextStyle bold14White = TextStyle(
  fontSize: 14.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: kWhite,
  overflow: TextOverflow.ellipsis,
);

final TextStyle bold14Blue = TextStyle(
  fontSize: 14.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: primaryBlueColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle bold18Blue = TextStyle(
  fontSize: 18.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: primaryBlueColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle bold16Blue = TextStyle(
  fontSize: 16.sp,
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: primaryBlueColor,
  overflow: TextOverflow.ellipsis,
);
