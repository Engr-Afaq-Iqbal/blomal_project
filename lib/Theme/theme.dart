import 'package:blomal_project/Theme/colors.dart';
import 'package:blomal_project/Utils/fontStyles.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primaryColor: primaryBlueColor,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: createMaterialColor(Color(int.parse('ff5271FB', radix: 16))),
  ).copyWith(
    background: const Color(0xffFFFFFF),
  ),
  fontFamily: fontFamily,
  dialogBackgroundColor: Colors.white,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent,
    elevation: 0.0,
  ),
);
