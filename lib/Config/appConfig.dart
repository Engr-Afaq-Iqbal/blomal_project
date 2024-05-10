import 'package:blomal_project/Theme/colors.dart';
import 'package:flutter/material.dart';

String imgUrl = "assets/images/";

class AppConfig {
  // API base url
  static String baseUrl =
      "https://api.blomal-capital.staging.azcs3.justcoded.com/v1/";
}

class AppStyles {
  /// field border styles
  static OutlineInputBorder outlineBorder(context,
          {bool isBorderColorApply = true}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          width: 0.5,
          color: isBorderColorApply ? primaryBlueColor : Colors.transparent,
        ),
      );

  static outlineBorderDecoration(context, {bool isBorderColorApply = true}) =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 0.5,
          color: isBorderColorApply ? primaryBlueColor : Colors.transparent,
        ),
      );

  static UnderlineInputBorder underlineBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: primaryBlueColor),
  );

  /// Divider Line
  static Widget dividerLine(
          {double? height, double? width, Color? color, double? margin}) =>
      Container(
        margin: width != null
            ? EdgeInsets.symmetric(horizontal: margin ?? 0)
            : null,
        height: height ?? 0.7,
        width: width,
        color: color ?? secBorderColor,
      );
}
